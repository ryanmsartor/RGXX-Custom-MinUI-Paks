#!/bin/bash

export EMU="GBA"
EMU_EXE="mgba"

ROM="$1"
DIR="$(dirname "$0")"
AUTO_RESUME_FILE="/mnt/sdcard/.userdata/shared/.minui/auto_resume.txt"

Test_Button_POWER(){
	evtest --query "/dev/input/event0" "EV_KEY" "KEY_POWER"
}

monitor_for_kill() {
while true; do
	Test_Button_POWER
	if [ $? -eq 10 ]; then
		sleep 2
		Test_Button_POWER
		if [ $? -eq 10 ]; then
			killall -15 retroarch
			touch /tmp/shutdown_from_pak
		fi
	fi
	sleep 0.05
done
}

rm /tmp/shutdown_from_pak 2>/dev/null
monitor_for_kill &

"$DIR/RA_launch.sh" "${EMU_EXE}_libretro.so" "$ROM" > "$DIR/log.txt" 2>&1

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