#!/bin/sh

cd /mnt/mmc/
mv dmenu.bin.disabled dmenu.bin

rmdir /mnt/sdcard/Emu || true
rmdir /mnt/sdcard/Video || true
rmdir /mnt/sdcard/Music || true
rmdir /mnt/sdcard/Ebook || true
rm -r /mnt/sdcard/.pixel_reader_store || true

cd /mnt/sdcard/Roms/
find . -type d -empty -delete

sync
reboot
