#! /bin/sh

## Power menu (rofi) in Polybar
##
## Modified from: https://github.com/ericmurphyxyz/dotfiles/blob/master/.local/bin/powermenu
##
## Script called by: ~/.config/polybar/modules/powermenu.ini


chosen=$(printf "\n\n\n\n" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"") sudo shutdown now ;;
	"") sudo reboot ;;
	"") systemctl suspend-then-hibernate ;;
	"") bspc quit ;;
	"") i3lock -i $HOME/.config/wallpapers/screenlock-arch.png -c '#2f343f' ;;
	*) exit 1 ;;
esac
