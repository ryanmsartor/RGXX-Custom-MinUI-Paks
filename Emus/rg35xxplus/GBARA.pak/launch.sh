#!/bin/bash

export EMU="GBA"
EMU_EXE="mgba"

ROM="$1"
DIR="$(dirname "$0")"

"$DIR/RA_launch.sh" "${EMU_EXE}_libretro.so" "$ROM" > "$DIR/log.txt" 2>&1
