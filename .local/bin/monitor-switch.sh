#!/bin/sh

laptop () {
    xrandr --output eDP-1 --auto --output HDMI-1 --off
    sleep 2
    bspc wm -r
}

monitor () {

    if [[ $(xrandr -q | grep -c "HDMI-1 connected") -eq 1 ]]; then
        xrandr --output eDP-1 --off --output HDMI-1 --auto
    else
        xrandr --output eDP-1 --auto --output HDMI-1 --off
    fi

    sleep 2
    bspc wm -r
}

dual () {

    if [[ $(xrandr -q | grep -c "HDMI-1 connected") -eq 1 ]]; then
        xrandr --output eDP-1 --auto --output HDMI-1 --auto --same-as eDP-1
    else
        xrandr --output eDP-1 --auto --output HDMI-1 --off
    fi

    sleep 2
    bspc wm -r
}

case "$1" in
    "--laptop")  laptop ;;
    "--monitor") monitor ;;
    "--dual")    dual ;;
    *) exit 1 ;;
esac
