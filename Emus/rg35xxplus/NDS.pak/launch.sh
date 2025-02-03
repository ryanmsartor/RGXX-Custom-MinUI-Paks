#!/bin/bash

THIS_DIR="$(dirname "$0")"
EMU_TAG=$(basename "$THIS_DIR" .pak)
ROM="$1"
SWITCH="/sys/class/power_supply/axp2202-battery/nds_pwrkey"
ESC="/sys/class/power_supply/axp2202-battery/nds_esckey"
AUTO_RESUME_FILE="/mnt/sdcard/.userdata/shared/.minui/auto_resume.txt"

rm /tmp/shutdown_from_pak 2>/dev/null

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
			killall -15 drastic
			touch /tmp/shutdown_from_pak
		fi
	fi
	sleep 0.05
done
}

VOLFILE="/sys/class/power_supply/axp2202-battery/openbor_volume"
STOCK_VOL=$(cat $VOLFILE)
MINUI_VOL=$(amixer sget "lineout volume" | tail -c5 | head -c2)
[[ $MINUI_VOL =~ ^"[" ]] && MINUI_VOL=${MINUI_VOL:1}
[[ $MINUI_VOL == "00" ]] && MINUI_VOL=100
(( MINUI_VOL += 5 ))
STOCK_VOL=$(( MINUI_VOL / 10 ))
echo $STOCK_VOL > $VOLFILE

echo "0" > "$SWITCH"
echo "1" > "$ESC"
monitor_for_kill &

export LD_LIBRARY_PATH="/usr/lib32:/usr/lib:$LD_LIBRARY_PATH"

if grep -q "RG28xx" /mnt/vendor/oem/board.ini; then
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh lcd_run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
else
	/mnt/vendor/ctrl/setNDS.sh savedir /mnt/sdcard;
	/mnt/vendor/ctrl/setNDS.sh run "$ROM" > "$LOGS_PATH/$EMU_TAG.txt" 2>&1;
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
echo "0" > "$SWITCH"
echo "0" > "$ESC"
