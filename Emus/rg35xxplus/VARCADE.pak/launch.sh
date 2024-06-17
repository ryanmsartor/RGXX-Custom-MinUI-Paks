#!/bin/sh

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
HOME="$USERDATA_PATH"
cd "$HOME"

bash /mnt/sdcard/Emus/rg35xxplus/VARCADE.pak/RA_launch_VA.sh fbneo_libretro.so "$ROM" > /mnt/sdcard/Emus/rg35xxplus/VARCADE.pak/log.txt 2>&1
