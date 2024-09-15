#!/bin/sh

cd /mnt/sdcard/
mv "Collections" ".Collections" || true
mv "Tools/rg35xxplus/.Switch to Collections.pak" "Tools/rg35xxplus/Switch to Collections.pak" || true
mv "Tools/rg35xxplus/Switch to Consoles.pak" "Tools/rg35xxplus/.Switch to Consoles.pak" || true

cd Roms
for folder in .*; do mv "$folder" "${folder#.}"; done
mv ".APPS" "APPS" || true

sync

