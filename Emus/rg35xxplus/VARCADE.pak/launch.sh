#!/bin/sh

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
DIR="$(dirname "$0")"
HOME="$USERDATA_PATH"
cd "$HOME"

"$DIR/RA_launch_VA.sh" "fbneo_libretro.so" "$ROM" > "$DIR/log.txt" 2>&1
