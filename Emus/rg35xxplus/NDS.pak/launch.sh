#!/bin/bash

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
ESC="/sys/class/power_supply/axp2202-battery/nds_esckey"

VOLFILE="/sys/class/power_supply/axp2202-battery/openbor_volume"

STOCK_VOL=$(cat $VOLFILE)
MINUI_VOL=$(amixer sget "lineout volume" | tail -c5 | head -c2)

[[ $MINUI_VOL =~ ^"[" ]] && MINUI_VOL=${MINUI_VOL:1}
[[ $MINUI_VOL == "00" ]] && MINUI_VOL=100
(( MINUI_VOL += 5 ))
STOCK_VOL=$(( MINUI_VOL / 10 ))
echo $STOCK_VOL > $VOLFILE

echo "0" > "$SWITCH"
echo "1" > "$ESC"

export LD_LIBRARY_PATH="/usr/lib32:/usr/lib:$LD_LIBRARY_PATH"

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh lcd_run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
fi

echo "0" > "$SWITCH"
echo "0" > "$ESC"
