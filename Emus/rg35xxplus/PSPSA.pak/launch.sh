#!/bin/sh

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
ESC="/sys/class/power_supply/axp2202-battery/nds_esckey"

echo "0" > "$SWITCH"
echo "1" > "$ESC"

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	bash /mnt/vendor/deep/ppsspp/lcd_psp.sh "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	cd /mnt/vendor/deep/ppsspp;
	./PPSSPPSDL "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
fi

echo "0" > "$SWITCH"
echo "0" > "$ESC"