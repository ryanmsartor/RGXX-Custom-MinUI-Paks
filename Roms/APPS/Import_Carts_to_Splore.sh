#!/bin/bash

CARTS="/mnt/sdcard/Tools/rgb30/Splore.pak/pico-8/carts"
TF1_ROMS="/mnt/mmc/Roms/PICO"
TF2_ROMS="/mnt/sdcard/Roms/PICO"

mkdir "$CARTS" > /dev/null 2>&1

cd "$TF1_ROMS"
for CART in *
do
	cp -n "$CART" "$CARTS"
done

cd "$TF2_ROMS"
for CART in *
do
	cp -n "$CART" "$CARTS"
done

sync
