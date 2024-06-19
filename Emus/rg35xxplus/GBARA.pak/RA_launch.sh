#!/bin/bash

# Command line schema
# $1 = Core/ports (fbalpha2012_libretro.so)
# $2 = Game/port script (/mnt/mmc/Roms/CPS2/avsp.zip)
# $3 = savestate_auto_load (auto)

# 设置路径参数
ROMFILE="${2}"
ROMPATH=${ROMFILE%/*}  # mnt/mmc/Roms/CPS2
FILENAME=${ROMFILE##*/}  # avsp.zip
ROMNAME=${FILENAME%.*}  # avsp
EXTNAME=${FILENAME##*.}  # zip

COREDIR="/mnt/vendor/deep/retro/cores"
RACONFIG="/.config/retroarch/retroarch.cfg"
RACONFIG_DIR="/.config/retroarch/tmp"
RACONFIG_EMU="${RACONFIG_DIR}/retroarch_${EMU}.cfg"
RA_ORI_CFG="/mnt/vendor/deep/retro/retroarch.cfg"
RABIN="/mnt/vendor/deep/retro/retroarch"
G_DIR="/mnt/mod/ctrl/configs"
G_CONF="${G_DIR}/system.cfg"
BIN_DIR="/mnt/mod/ctrl"
DARKSET="/.config/retroarch/dark.txt"
SHADER_CFG="/mnt/vendor/deep/retro/config/global.glslp"
TURBO_BTN=9
if [ -f /mnt/mod/ctrl/configs/tk.cfg ]; then
	TURBO_BTN=$(head -n 1 /mnt/mod/ctrl/configs/tk.cfg)
fi
if [[ ${EMU} == "N64" ]] || [[ ${EMU} == "PS" ]] || [[ ${EMU} == "SATURN" ]]; then
	TURBO_BTN="nul"
fi

function close_bezel() {
	sed -i '/input_overlay_enable = "/d' ${RACONFIG}
	echo "input_overlay_enable = \""false"\"" >> ${RACONFIG}
	sed -i '/aspect_ratio_index = "/d' ${RACONFIG}
	sed -i '/custom_viewport_width = "/d' ${RACONFIG}
	sed -i '/custom_viewport_height = "/d' ${RACONFIG}
	sed -i '/custom_viewport_x = "/d' ${RACONFIG}
	sed -i '/custom_viewport_y = "/d' ${RACONFIG}
	sed -i '/video_scale_integer = "/d' ${RACONFIG}
	sed -i '/input_overlay_opacity = "/d' ${RACONFIG}
	echo 'aspect_ratio_index = "22"' >> ${RACONFIG}
	echo 'video_scale_integer = "false"' >> ${RACONFIG}
	echo 'input_overlay_opacity = "1.000000"' >> ${RACONFIG}
}

function close_shader() {
	sed -i '/video_shader_enable = "/d' ${RACONFIG}
	echo "video_shader_enable = \""false"\"" >> ${RACONFIG}
	rm -f ${SHADER_CFG}
}
# 确保路径存在
if [ ! -d ${G_DIR} ]
then
	mkdir -p ${G_DIR}
fi
if [ ! -d ${RACONFIG_DIR} ]
then
	mkdir -p ${RACONFIG_DIR}
fi

# 确保模拟器配置等文件存在
if [ ! -f ${RACONFIG} ]
then
	cp -f "${RA_ORI_CFG}" "${RACONFIG}"
fi
if [ ! -f ${RACONFIG_EMU} ]
then
	touch ${RACONFIG_EMU}
fi

# 边框设置
${BIN_DIR}/bezels.sh "${EMU}" "${ROMFILE}"

# 滤镜设置
${BIN_DIR}/shaders.sh "${EMU}"

# 默认连发快捷键
sed -i '/input_player1_turbo_btn = "/d' ${RACONFIG}
echo "input_player1_turbo_btn = \""$TURBO_BTN"\"" >> ${RACONFIG}

# 自动连发
if [[ ! "${3}" == "auto" ]]; then
	if [[ ${EMU} == "VARCADE" ]]; then
		sed -i '/input_player1_turbo_btn =/d' ${RACONFIG}
		echo "input_player1_turbo_btn = \""2"\"" >> ${RACONFIG}
	fi
fi

# DOS 模拟器软键盘
if [[ ${EMU} == "DOS" ]]; then
	sed -i '/input_player1_l3_btn =/d' ${RACONFIG_EMU}
	echo "input_player1_l3_btn = \""9"\"" >> ${RACONFIG_EMU}
fi

# 设置运行命令行
case ${EMU} in
	FBNEO|NEOGEO|MAME|HBMAME|VARCADE|CPS*)
		if grep -q "arcade.auto=1" ${G_CONF}; then
			RUNTHIS='${BIN_DIR}/autocore.sh "${1}" "${2}" "${EMU}"'
		else
			RUNTHIS='${RABIN} -c ${RACONFIG} -L "${COREDIR}/${1}" --appendconfig ${RACONFIG_EMU} "${2}"'
		fi
	;;
	PORTS)
		if [[ ${EXTNAME} == "sh" ]] || [[ ${EXTNAME} == "SH" ]]; then
			RUNTHIS='/bin/bash "${2}"'
		else
			RUNTHIS='${RABIN} -c ${RACONFIG} -L "${COREDIR}/${1}" --appendconfig ${RACONFIG_EMU} "${2}"'
		fi
	;;
	*)
		RUNTHIS='${RABIN} -c ${RACONFIG} -L "${COREDIR}/${1}" --appendconfig ${RACONFIG_EMU} "${2}"'
	;;
esac

if [ -z ${1} ]; then
	RUNTHIS='${RABIN} -c ${RACONFIG}'
fi

# 运行游戏
eval ${RUNTHIS}

# 关闭边框
if ! grep -q "global.bezel=2" ${G_CONF} ; then
	close_bezel &
fi

# 关闭全局滤镜
if ! grep -q "global.shader=2" ${G_CONF} ; then
	close_shader &
fi

sync
exit 0
