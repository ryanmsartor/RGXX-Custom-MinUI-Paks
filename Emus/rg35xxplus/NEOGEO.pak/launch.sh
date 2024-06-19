#!/bin/bash

export EMU="NEOGEO"
EMU_EXE="fbalpha2012"

ROM="$1"
DIR="$(dirname "$0")"

"$DIR/RA_launch.sh" "${EMU_EXE}_libretro.so" "$ROM" > "$DIR/log.txt" 2>&1
