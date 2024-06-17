#!/bin/sh

PICO8_DIR="/mnt/sdcard/Tools/rgb30/Splore.pak/pico-8"
DIR="/mnt/sdcard/Tools/rg35xxplus/Splore.pak"

export LD_LIBRARY_PATH="$DIR:$LD_LIBRARY_PATH"
export PATH="$DIR:$PATH"

# add sdl controller file if not present in pico-8 folder
if [ ! -f "$PICO8_DIR/sdl_controllers.txt" ]; then
 cp "$DIR/sdl_controllers.txt" "$PICO8_DIR";
fi

cmp -s "$DIR/sdl_controllers.txt" "$PICO8_DIR/sdl_controllers.txt"
if [ "$?" -eq 1 ]; then
	cp -f "$DIR/sdl_controllers.txt" "$PICO8_DIR";
fi

cd "$PICO8_DIR"
./pico8_dyn -run "$1" -joystick 0 > ./p8native-log.txt 2>&1
