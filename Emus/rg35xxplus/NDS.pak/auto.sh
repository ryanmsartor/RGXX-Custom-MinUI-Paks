#!/bin/bash
AUTO_RESUME_FILE="/mnt/sdcard/.userdata/shared/.minui/auto_resume.txt"
NDS_EMU="/mnt/sdcard/Emus/rg35xxplus/NDS.pak/launch.sh"

if [ -f "$AUTO_RESUME_FILE" ]; then
	ROM_TO_RESUME="$(cat "$AUTO_RESUME_FILE")"
else
	exit
fi

if grep -q "(NDS)" $AUTO_RESUME_FILE; then
	"$NDS_EMU" "$ROM_TO_RESUME"
fi