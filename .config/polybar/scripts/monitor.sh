#!/bin/sh

## Monitor switch in Polybar
##
## Script called by: ~/.config/polybar/modules/monitor.ini


chosen=$(printf "\n󰍹\n󰍺" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"") source $HOME/.local/bin/monitor-switch.sh --laptop ;;
	"󰍹") source $HOME/.local/bin/monitor-switch.sh --monitor ;;
	"󰍺") source $HOME/.local/bin/monitor-switch.sh --dual ;;
	*) exit 1 ;;
esac
