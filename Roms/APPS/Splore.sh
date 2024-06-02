#!/bin/sh

export LD_LIBRARY_PATH="/mnt/vendor/sdl2:$LD_LIBRARY_PATH"

DIR="$(dirname "$0")"
cd "$DIR"

cd ./pico-8 && ./pico8_dyn -splore -root_path "../../PICO/" -joystick 0 > ./splore-log.txt 2>&1
