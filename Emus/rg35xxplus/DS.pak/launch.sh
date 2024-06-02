#!/bin/sh

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh lcd_run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
fi