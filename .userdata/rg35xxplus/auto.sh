#!/bin/bash

AUTO_RESUME_FILE="$SDCARD_PATH/.userdata/shared/.minui/auto_resume.txt"
if [ -f "$AUTO_RESUME_FILE" ]; then
	echo "Auto resume file exists."
	# if the auto_resume.txt doesn't have /mnt/sdcard in front, then it was most likely created by MinArch, so exit from this implementation to let MinUI handle the resume.
	if ! grep -q "$SDCARD_PATH" "$AUTO_RESUME_FILE"; then
		exit
	fi

	ROM_TO_RESUME="$(cat "$AUTO_RESUME_FILE")"
	PAK_TO_USE="$(echo "$ROM_TO_RESUME" | cut -d'(' -f2 | cut -d')' -f1)"
	LAUNCH="$SDCARD_PATH/Emus/$PLATFORM/$PAK_TO_USE.pak/launch.sh"

	if [ -f "$LAUNCH" ]; then
		# Launch the game via the appropriate pak
		"$LAUNCH" "$ROM_TO_RESUME"
	fi
fi