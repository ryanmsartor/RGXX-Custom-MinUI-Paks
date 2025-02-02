#!/bin/sh

export HOME="$(dirname "$0")"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export PATH="$HOME/bin:$PATH"

. "$HOME/bin/test_btns"

monitor_for_kill() {
while true; do
	Test_Button_POWER
	[ $? -eq 10 ] && killall -15 pico8_dyn
	sleep 0.05
done
}

launch_cart() {
	case "$1" in
		*"Splore"* | *"splore"* )
			pico8_dyn -splore -joystick 0 -root_path "/mnt/sdcard/Roms/Pico-8 (P8-NATIVE)"
			;;
		* )
			pico8_dyn -run "$1" -joystick 0 -root_path "/mnt/sdcard/Roms/Pico-8 (P8-NATIVE)"
			;;
	esac
}

monitor_for_kill &

if [ -f "$HOME/bin/pico8_dyn" ]; then
	cd "$HOME/bin" && launch_cart "$1"
else
	show.elf "$HOME/missing.png" 4
fi

kill "$!"