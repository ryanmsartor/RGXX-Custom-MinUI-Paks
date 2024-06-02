#!/bin/sh

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	bash /mnt/vendor/deep/ppsspp/lcd_psp.sh "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	cd /mnt/vendor/deep/ppsspp;
	./PPSSPPSDL "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
fi
