#!/bin/sh

## Display Microphone status in Polybar
##
## Modified from: https://github.com/polybar/polybar-scripts/
## Original script: < pulseaudio-tail >
##
## Script called by: ~/.config/polybar/modules/microphone.ini


microphone_print() {

    device=$(pactl get-default-source)

    micro_status=$(pactl get-source-mute $device | grep -c "yes")

    if [[ $micro_status -eq 1 ]]
    then
        echo "%{F#555555}%{T6}%{T-}%{T4}%{T-}%{F-}"
    else
        echo "%{F#d8dee9}%{T6}%{T-}%{T4}%{T-}%{F-}"
    fi
}

listen() {

    microphone_print

    pactl subscribe | while read -r event; do

        if echo "$event" | grep -q "source"; then

            microphone_print
        fi
    done
}

case "$1" in
    *)
        listen
        ;;
esac
