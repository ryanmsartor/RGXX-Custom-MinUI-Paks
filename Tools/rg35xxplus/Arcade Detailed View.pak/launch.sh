#!/bin/sh
if [ -d "/mnt/sdcard/Tools/rg35xxplus/Arcade Filename View.pak" ]; then # switch from detail to filename view
	mv -f "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/map.txt" "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/.map_detail.txt"
	mv -f "/mnt/sdcard/Tools/rg35xxplus/Arcade Filename View.pak" "/mnt/sdcard/Tools/rg35xxplus/Arcade Title View.pak";
elif [ -d "/mnt/sdcard/Tools/rg35xxplus/Arcade Title View.pak" ]; then # switch from filename to title view
	mv -f "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/.map_title.txt" "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/map.txt"
	mv -f "/mnt/sdcard/Tools/rg35xxplus/Arcade Title View.pak" "/mnt/sdcard/Tools/rg35xxplus/Arcade Detailed View.pak";
elif [ -d "/mnt/sdcard/Tools/rg35xxplus/Arcade Detailed View.pak" ]; then # switch from title to detail view
	mv -f "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/map.txt" "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/.map_title.txt"
	mv -f "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/.map_detail.txt" "/mnt/sdcard/Roms/Vertical Arcade (VARCADE)/map.txt"
	mv -f "/mnt/sdcard/Tools/rg35xxplus/Arcade Detailed View.pak" "/mnt/sdcard/Tools/rg35xxplus/Arcade Filename View.pak";
fi
# sync
