#!/bin/sh

export HOME="$(dirname "$0")"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"
export PATH="$HOME/bin:$PATH"

. "$HOME/bin/test_btns"

monitor_for_kill() {
while true; do
	Test_Button_POWER
	if [ $? -eq 10 ]; then
		sleep 2
		Test_Button_POWER
		if [ $? -eq 10 ]; then
			touch /tmp/shutdown_from_pak
		fi
		killall -15 pico8_dyn
	fi
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

if [ -f /tmp/shutdown_from_pak ]; then
	echo 1 > /sys/class/power_supply/axp2202-battery/work_led
	echo "$ROM" > "$AUTO_RESUME_FILE"
	sync
	rm /tmp/minui_exec
	shutdown
	while :; do
		sleep 1
	done
fi

kill "$!"