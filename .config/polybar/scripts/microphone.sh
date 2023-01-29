#!/bin/sh

device=$(pactl get-default-source)

micro_status=$(pactl get-source-mute $device | grep -c "yes")

if [[ $micro_status -eq 1 ]]
then
    echo "%{F#555555}%{T6}%{T-}%{T4}%{T-}%{F-}"
else
    echo "%{F#d8dee9}%{T6}%{T-}%{T4}%{T-}%{F-}"
fi
