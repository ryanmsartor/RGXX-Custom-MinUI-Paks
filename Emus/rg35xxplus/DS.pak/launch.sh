#!/bin/bash

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
DIR="$(dirname "$0")"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
export PATH="/mnt/vendor/bin:$PATH"

. "$DIR/test_btns"

{
while true; do
	Test_Button_POWER;
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

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh lcd_run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
fi

kill $!
