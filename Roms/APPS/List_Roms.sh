#!/bin/bash

LIST="/mnt/mmc/romlist.txt"
rm $LIST
touch $LIST

cd /mnt/mmc/Roms
echo "SD Card 1:" >> $LIST;
echo "" >> $LIST;
for DIR in */; do 
	echo "$DIR" >> $LIST; 
	echo "" >> $LIST; 
	ls -A1 "$DIR" >> $LIST; 
	echo "" >> $LIST;
	echo "" >> $LIST;
done

if [ -d /mnt/sdcard/Roms ]; then
	cd /mnt/sdcard/Roms;
	echo "SD Card 2:" >> $LIST;
	echo "" >> $LIST;
	for DIR in */; do 
		echo "$DIR" >> $LIST; 
		echo "" >> $LIST; 
		ls -A1 "$DIR" >> $LIST; 
		echo "" >> $LIST;
		echo "" >> $LIST;
	done
fi
