#! /bin/sh
output='/home/nicolas/screenshots/screenshot-%Y-%m-%d-%T.png'

case "$1" in
	"select") scrot "$output" --select --line mode=edge || exit ;;
	"window") scrot "$output" --focused --border || exit ;;
	*) scrot "$output" || exit ;;
esac

notify-send "Screenshot taken."
