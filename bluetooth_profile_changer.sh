#!/bin/bash

current_mode_is_a2dp=`pactl list | grep Active | grep a2dp`
card=`pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2`

if [ -n "$current_mode_is_a2dp" ]; then
    echo "Switching $card to mSBC (headset, for making calls)..."
    notify-send "Calls setup" --expire-time 30
    pactl set-card-profile $card headset-head-unit-msbc
else
    echo "Switching $card to A2DP (high-fidelity playback)..."
    notify-send "Stereo setup" --expire-time 30
    pactl set-card-profile $card a2dp-sink
fi
