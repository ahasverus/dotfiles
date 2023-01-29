#!/bin/sh

blue_status=$(bluetooth | grep -c "on")

if [[ blue_status -eq 0 ]]
then
    echo "%{F#555555}󰂲%{T4} Down%{T-}%{F-}"
else
    sleep 1
    device=$(bluetoothctl devices Connected | cut -d ' ' -f 3-)
    if [[ "$device" = "" ]]
    then
        echo "%{F#d8dee9}󰂯%{T4} ────%{T-}%{F-}"
    else
        echo "%{F#d8dee9}󰂯%{T4} $device%{T-}%{F-}"
    fi
fi
