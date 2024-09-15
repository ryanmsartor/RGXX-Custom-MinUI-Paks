#!/bin/sh

PICO8_DIR="/mnt/sdcard/Tools/rgb30/Splore.pak/pico-8"
DIR="/mnt/sdcard/Tools/rg35xxplus/Splore.pak"

export LD_LIBRARY_PATH="$DIR:$LD_LIBRARY_PATH"
export PATH="$DIR:$PATH"

if [ ! -d ./pico-8 ]; then
	show.elf "$DIR/missing.png" 4
	exit
fi

# add sdl controller file if not present in pico-8 folder
if [ ! -f "$PICO8_DIR/sdl_controllers.txt" ]; then
 cp "$DIR/sdl_controllers.txt" "$PICO8_DIR";
fi

# ensure correct sdl controller file is in place
cmp -s "$DIR/sdl_controllers.txt" "$PICO8_DIR/sdl_controllers.txt"
if [ "$?" -eq 1 ]; then
	cp "$DIR/sdl_controllers.txt" "$PICO8_DIR";
fi

cd "$PICO8_DIR" && ./pico8_dyn -splore -joystick 0 > ./splore-log.txt 2>&1
