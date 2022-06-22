#!/bin/bash

current_mode_is_a2dp=`pactl list | grep Active | grep a2dp`
card=`pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2`

if [ -z "$card" ]; then
    echo "Bluetooth not connected"
    notify-send "Bluetooth not connected" --expire-time 30
    exit 0
fi

if [ -n "$current_mode_is_a2dp" ]; then
    notify-send "Current setup - Stereo" --expire-time 30
else
    notify-send "Current setup - Calls" --expire-time 30
fi

