#!/bin/sh

EMU_EXE=ppsspp

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
PSP_DIR="/mnt/sdcard/Emus/rg35xxplus/PSPRA.pak"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
export PATH="/mnt/vendor/bin:$PATH"

. "$PSP_DIR/test_btns"

{
while true; do
	Test_Button_R2;
	if [ $? -eq 10 ]; then
		if grep -q "0" "$SWITCH"; then
			echo "1" > "$SWITCH";
		else
			echo "0" > "$SWITCH";
		fi
		sleep 0.3
	fi;
done
} &

/mnt/vendor/deep/retro/retroarch -L "/mnt/vendor/deep/retro/cores/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1

kill $!
