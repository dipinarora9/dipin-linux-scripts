#!/bin/bash

current_mode_is_a2dp=`pactl list | grep Active | grep a2dp`
card=`pactl list | grep "Name: bluez_card." | cut -d ' ' -f 2`

if [ -z "$card" ]; then
    echo "Bluetooth not connected"
    notify-send "Bluetooth not connected" --expire-time 30
    exit 0
fi

pactl set-card-profile $card a2dp-sink
amixer sset Capture 0%
amixer set Capture cap

if [ -n "$current_mode_is_a2dp" ]; then
    echo "Switching $card to mSBC (headset, for making calls)..."
    pactl set-card-profile $card headset-head-unit-msbc
    amixer set Capture cap
    amixer sset Capture 90%
else
    echo "Switching $card to A2DP (high-fidelity playback)..."
    pactl set-card-profile $card a2dp-sink
    amixer set Capture nocap
fi
