#!/bin/sh

EMU_EXE=ppsspp

###############################

EMU_TAG=$(basename "$(dirname "$0")" .pak)
ROM="$1"
DIR="$(dirname "$0")"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
export PATH="/mnt/vendor/bin:$PATH"
AUTO_RESUME_FILE="/mnt/sdcard/.userdata/shared/.minui/auto_resume.txt"

. "$DIR/test_btns"

{
while true; do
	Test_Button_R2
	if [ $? -eq 10 ]; then
		if grep -q "0" "$SWITCH"; then
			echo "2" > "$SWITCH"
		else
			echo "0" > "$SWITCH"
		fi
		sleep 0.3
	fi

	Test_Button_POWER
	if [ $? -eq 10 ]; then
		sleep 2
		Test_Button_POWER
		if [ $? -eq 10 ]; then
			killall -15 retroarch
			touch /tmp/shutdown_from_pak
		fi
	fi
done
} &

rm /tmp/shutdown_from_pak 2>/dev/null

/mnt/vendor/deep/retro/retroarch -L "/mnt/vendor/deep/retro/cores/${EMU_EXE}_libretro.so" "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1

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
kill $!
echo "0" > "$SWITCH"
