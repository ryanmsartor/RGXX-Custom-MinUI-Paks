#!/bin/sh

THIS_PAK="$(dirname "$0")"
TOOLS="${THIS_PAK}/.."

VA="/mnt/sdcard/Roms/Vertical Arcade (VARCADE)"
NG="/mnt/sdcard/Roms/Neo-Geo (NEOGEO)"

if [ -d "${TOOLS}/Arcade Filename View.pak" ]; then # switch from detail to filename view
	for DIR in "$VA" "$NG"; do
		mv -f "${DIR}/map.txt" "${DIR}/.map_detail.txt";
	done
	mv -f "${TOOLS}/Arcade Filename View.pak" "${TOOLS}/Arcade Title View.pak";

elif [ -d "${TOOLS}/Arcade Title View.pak" ]; then # switch from filename to title view
	for DIR in "$VA" "$NG"; do
		mv -f "${DIR}/.map_title.txt" "${DIR}/map.txt";
	done
	mv -f "${TOOLS}/Arcade Title View.pak" "${TOOLS}/Arcade Detailed View.pak";

elif [ -d "${TOOLS}/Arcade Detailed View.pak" ]; then # switch from title to detail view
	for DIR in "$VA" "$NG"; do
		mv -f "${DIR}/map.txt" "${DIR}/.map_title.txt";
		mv -f "${DIR}/.map_detail.txt" "${DIR}/map.txt";
	done
	mv -f "${TOOLS}/Arcade Detailed View.pak" "${TOOLS}/Arcade Filename View.pak";

fi
