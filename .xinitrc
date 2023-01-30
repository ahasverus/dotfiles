#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# define keyboard layout
setxkbmap -layout "ca" -variant "fr"

# touchpad configuration
xinput set-prop 11 331 15 # Scrolling Pixel Distance
xinput set-prop 11 313  1 # Natural Scrolling Enabled
xinput set-prop 11 334  1 # Tapping Enabled

# disable wlan
rfkill block wifi &

# disable bluetooth
bluetooth off &

# mute microphone
pactl set-source-mute $(pactl get-default-source) on &

# start wm
exec bspwm
