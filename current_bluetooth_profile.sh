#!/bin/bash

current_mode_is_a2dp=`pactl list | grep Active | grep a2dp`

if [ -n "$current_mode_is_a2dp" ]; then
    notify-send "Current setup - Stereo" --expire-time 30
else
    notify-send "Current setup - Calls" --expire-time 30
fi

