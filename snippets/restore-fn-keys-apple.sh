#!/bin/bash

# source: https://help.ubuntu.com/community/AppleKeyboard

set -e

if [ $(whoami) != "root" ]; then
  echo "Need to run as root"
fi

# Immediately apply
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode

# Setup for subsequent boots
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
