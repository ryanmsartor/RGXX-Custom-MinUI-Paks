#!/bin/sh

cd /mnt/mmc/
mv dmenu.bin dmenu.bin.disabled
sync
rm /tmp/minui_exec
reboot

while :; do
    sleep 1
end
