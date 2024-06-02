#!/bin/sh

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
HOME="$USERDATA_PATH"
cd "$HOME"

# Use built-in stock script (requires Roms folder to be exactly named VARCADE)
# /mnt/mod/ctrl/RA_launch.sh fbneo_libretro.so "$ROM"


# Use new modified script instead
bash /mnt/sdcard/Emus/rg35xxplus/VARCADE.pak/RA_launch_VA.sh fbneo_libretro.so "$ROM" > /mnt/sdcard/Emus/rg35xxplus/VARCADE.pak/log.txt 2>&1
