#!/bin/sh

EMU_EXE=mupen64plus_next

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
DIR="$(dirname "$0")"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
export PATH="/mnt/vendor/bin:$PATH"

. "$DIR/test_btns"

{
while true; do
	Test_Button_SE;
	if [ $? -eq 10 ]; then
		if grep -q "0" "$SWITCH"; then
			echo "2" > "$SWITCH";
		else
			echo "0" > "$SWITCH";
		fi
		sleep 0.3
	fi; 
done
} &

/mnt/vendor/deep/retro/retroarch -L "/mnt/vendor/deep/retro/cores/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1

kill $!
echo "0" > "$SWITCH"
