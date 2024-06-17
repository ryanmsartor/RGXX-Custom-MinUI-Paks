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
EMU="VARCADE"


COREDIR="/mnt/vendor/deep/retro/cores"
RACONFIG="/.config/retroarch/retroarch.cfg"
RACONFIG_DIR="/.config/retroarch/tmp"
RACONFIG_EMU="${RACONFIG_DIR}/retroarch_${EMU}.cfg"
RA_ORI_CFG="/mnt/vendor/deep/retro/retroarch.cfg"
RABIN="/mnt/vendor/deep/retro/retroarch"
G_DIR="/mnt/mod/ctrl/configs"
G_CONF="${G_DIR}/system.cfg"
BIN_DIR="/mnt/mod/ctrl"
VARCSET="/.config/retroarch/varc.txt"
SHADER_CFG="/mnt/vendor/deep/retro/config/global.glslp"

if [[ $(cat /sys/class/extcon/hdmi/state) == "HDMI=1" ]]; then
	if [ -d /mnt/mmc/Roms/APPS/res1 ] && [ ! -d /mnt/mmc/Roms/APPS/res0 ]; then
		mv -f /mnt/mmc/Roms/APPS/res /mnt/mmc/Roms/APPS/res0 && mv -f /mnt/mmc/Roms/APPS/res1 /mnt/mmc/Roms/APPS/res
	fi
	if [ -d /mnt/mod/ctrl/res1 ] && [ ! -d /mnt/mod/ctrl/res0 ]; then
		mv -f /mnt/mod/ctrl/res /mnt/mod/ctrl/res0 && mv -f /mnt/mod/ctrl/res1 /mnt/mod/ctrl/res
	fi
elif [[ $(cat /sys/class/extcon/hdmi/state) == "HDMI=0" ]]; then
	if [ -d /mnt/mmc/Roms/APPS/res0 ] && [ ! -d /mnt/mmc/Roms/APPS/res1 ]; then
		mv -f /mnt/mmc/Roms/APPS/res /mnt/mmc/Roms/APPS/res1 && mv -f /mnt/mmc/Roms/APPS/res0 /mnt/mmc/Roms/APPS/res
	fi
	if [ -d /mnt/mod/ctrl/res0 ] && [ ! -d /mnt/mod/ctrlres1 ]; then
		mv -f /mnt/mod/ctrl/res /mnt/mod/ctrl/res1 && mv -f /mnt/mod/ctrl/res0 /mnt/mod/ctrl/res
	fi
fi

# 设置核心对应文件夹名称

CORE_FNAME="FinalBurn Neo"

CFG_FILE="/mnt/vendor/deep/retro/config/${CORE_FNAME}/${ROMNAME}.cfg"
REMAP_FILE="/mnt/vendor/deep/retro/remaps/${CORE_FNAME}/${ROMNAME}.rmp"

function set_varc() {
	# 设置连发快捷键和竖版街机按键映射
	mkdir -p "/mnt/vendor/deep/retro/config/${CORE_FNAME}"
	mkdir -p "/mnt/vendor/deep/retro/remaps/${CORE_FNAME}"
	echo 'input_turbo_mode = "2"' >"${CFG_FILE}"
	cat <<'EOF' >"${REMAP_FILE}"
input_libretro_device_p1 = "1"
input_libretro_device_p2 = "1"
input_libretro_device_p3 = "1"
input_libretro_device_p4 = "1"
input_libretro_device_p5 = "1"
input_player1_analog_dpad_mode = "1"
input_player1_btn_down = "7"
input_player1_btn_l2 = "0"
input_player1_btn_left = "5"
input_player1_btn_r = "2"
input_player1_btn_r2 = "3"
input_player1_btn_right = "4"
input_player1_btn_select = "8"
input_player1_btn_start = "0"
input_player1_btn_up = "6"
input_player2_analog_dpad_mode = "1"
input_player3_analog_dpad_mode = "1"
input_player4_analog_dpad_mode = "1"
input_player5_analog_dpad_mode = "0"
input_remap_port_p1 = "0"
input_remap_port_p2 = "1"
input_remap_port_p3 = "2"
input_remap_port_p4 = "3"
input_remap_port_p5 = "4"
EOF
}

TURBO_BTN=9

function reset_varc() {
	# 游戏结束后恢复连发快捷键和竖版街机按键映射
	if grep -q "input_player1_turbo_btn\ =" ${VARCSET}; then
		a=`cat ${VARCSET}`
		if grep -q "input_player1_turbo_btn\ =" ${RACONFIG}; then
			sed -i '/input_player1_turbo_btn = "/d' ${RACONFIG}
		fi
		echo "$a" >> ${RACONFIG}
	else
		if grep -q "input_player1_turbo_btn\ =" ${RACONFIG}; then
			sed -i -e '/input_player1_turbo_btn\ =/c input_player1_turbo_btn\ = \"'$TURBO_BTN'\"' ${RACONFIG}
		else
			echo "input_player1_turbo_btn = \""$TURBO_BTN"\"" >> ${RACONFIG}
		fi
	fi
	rm -f ${VARCSET}
	[ -f "${CFG_FILE}" ] && rm -f "${CFG_FILE}"
	[ -f "${REMAP_FILE}" ] && rm -f "${REMAP_FILE}"
}

function close_bezel() {
	# 关闭边框
	sed -i '/input_overlay_enable = "/d' ${RACONFIG}
	echo "input_overlay_enable = \""false"\"" >> ${RACONFIG}
	sed -i '/aspect_ratio_index = "/d' ${RACONFIG}
	sed -i '/custom_viewport_width = "/d' ${RACONFIG}
	sed -i '/custom_viewport_height = "/d' ${RACONFIG}
	sed -i '/custom_viewport_x = "/d' ${RACONFIG}
	sed -i '/custom_viewport_y = "/d' ${RACONFIG}
	sed -i '/video_scale_integer = "/d' ${RACONFIG}
	sed -i '/input_overlay_opacity = "/d' ${RACONFIG}
	echo 'aspect_ratio_index = "8"' >> ${RACONFIG}
	echo 'video_scale_integer = "false"' >> ${RACONFIG}
	echo 'input_overlay_opacity = "1.000000"' >> ${RACONFIG}
}

function close_shader() {
	# 关闭滤镜
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

# rotate controls for 28xx only
if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	VARC=""
	if [[ ! "${3}" == "auto" ]]; then
		rm -f ${VARCSET}
		touch ${VARCSET}
		# 备份原有连发快捷键并设置新快捷键
		sed -n '0,/'input_player1_turbo_btn\ ='/{/input_player1_turbo_btn =/p}' ${RACONFIG} > ${VARCSET}
		sed -i '/input_player1_turbo_btn =/d' ${RACONFIG}
		echo "input_player1_turbo_btn = \""$TURBO_BTN"\"" >> ${RACONFIG}
	fi
	VARC="1"
	set_varc
fi

# 边框设置
${BIN_DIR}/bezels.sh "${EMU}" "${ROMFILE}" "${VARC}"

# 滤镜设置
${BIN_DIR}/shaders.sh "${EMU}"

# 一键关机
if grep -q "power.quick=1" ${G_CONF}; then
	if grep -q 'network_cmd_enable = "false"' ${RACONFIG}; then
		sed -i '/savestate_auto_save =/d' ${RACONFIG}
		sed -i '/network_cmd_enable =/d' ${RACONFIG}
		echo "savestate_auto_save = \""true"\"" >> ${RACONFIG}
		echo "network_cmd_enable = \""true"\"" >> ${RACONFIG}
	fi
else
	if grep -q 'network_cmd_enable = "true"' ${RACONFIG}; then
		sed -i '/savestate_auto_save =/d' ${RACONFIG}
		sed -i '/network_cmd_enable =/d' ${RACONFIG}
		echo "savestate_auto_save = \""false"\"" >> ${RACONFIG}
		echo "network_cmd_enable = \""false"\"" >> ${RACONFIG}
	fi
fi

# 切换 RA 热键
if grep -q "ra.hotkey=0" ${G_CONF} && grep -q 'input_enable_hotkey_btn = "6"' ${RACONFIG}; then
	sed -i '/input_enable_hotkey_btn =/d' ${RACONFIG}
	echo "input_enable_hotkey_btn = \""8"\"" >> ${RACONFIG}
elif grep -q "ra.hotkey=1" ${G_CONF} && grep -q 'input_enable_hotkey_btn = "8"' ${RACONFIG}; then
	sed -i '/input_enable_hotkey_btn =/d' ${RACONFIG}
	echo "input_enable_hotkey_btn = \""6"\"" >> ${RACONFIG}
fi

# 设置运行命令行

if grep -q "arcade.auto=1" ${G_CONF}; then
	RUNTHIS='${BIN_DIR}/autocore.sh "${1}" "${2}" "${EMU}"'
else
	RUNTHIS='${RABIN} -c ${RACONFIG} -L "${COREDIR}/${1}" --appendconfig ${RACONFIG_EMU} "${2}"'
fi

if [ -z ${1} ]; then
	RUNTHIS='${RABIN} -c ${RACONFIG}'
fi

# 运行游戏
eval ${RUNTHIS}

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	reset_varc &
fi

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
