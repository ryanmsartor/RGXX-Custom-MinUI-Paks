#!/bin/sh

EMU_EXE=mupen64plus_next

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
HOME="$USERDATA_PATH"
cd "$HOME"
/mnt/vendor/deep/retro/retroarch -L "/mnt/vendor/deep/retro/cores/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1
