#!/bin/bash

locale-gen "en_US.UTF-8"
echo "LANG=en_US.UTF-8" > /etc/default/locale
apt -y update
apt -y install --reinstall wget
apt -y install --reinstall curl

if [ -f /usr/bin/wget ] && [ -f /usr/bin/curl ]; then
	mv "$0" "$0.disabled";
fi

sync
reboot
