#!/bin/sh

wifi_status=$(wifi | grep -c "on")

if [[ $wifi_status -eq 0 ]]
then
    echo "%{F#555555}%{T2}󰤭%{T-}%{T4} Down%{T-}%{F-}"
else
    device=$(nmcli connection show | grep "wlp" | cut -d ' ' -f 1)
    if [[ "$device" = "" ]]
    then
        echo "%{F#d8dee9}%{T2}󰤨%{T-}%{T4} ────%{T-}%{F-}"
    else
        echo "%{F#d8dee9}%{T2}󰤨%{T-}%{T4} $device%{T-}%{F-}"
    fi
fi
