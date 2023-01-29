#!/bin/sh

device=$(pactl get-default-sink)
headset=$(echo $device | grep -c 'bluez')

volume_status=$(pactl get-sink-mute $device | grep -c "yes")
volume_level=$(pactl get-sink-volume $device | grep -Po "[0-9]{1,}%" | head -n 1 | cut -d '%' -f 1)

if [[ $headset -eq 1 ]]
then
   icon="%{T8}󰋋%{T-}"
else
   if (($volume_level > 0  && $volume_level <= 33))
   then
      icon="%{T7}󰕿%{T-}"
   elif (($volume_level > 33 && $volume_level <= 66))
   then
      icon="%{T7}󰖀%{T-}"
   else
      icon="%{T7}󰕾%{T-}"
   fi
fi

if [[ $volume_status -eq 1 || $volume_level == 0 ]]
then
    echo "%{F#555555}%{T7}󰖁%{T-}%{T4} Muted%{T-}%{F-}"
else
    echo "%{F#d8dee9}$icon%{T4} $volume_level%%{T-}%{F-}"
fi
