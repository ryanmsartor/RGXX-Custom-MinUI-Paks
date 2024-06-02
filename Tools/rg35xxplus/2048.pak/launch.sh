#!/bin/sh

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
HOME="$USERDATA_PATH"
cd "$HOME"
/mnt/vendor/deep/retro/retroarch -L 2048_libretro.so
