#!/bin/sh

## Display Bluetooth status in Polybar (Down / On / Devices names)
##
## Modified from: https://github.com/polybar/polybar-scripts/
## Original script: < system-bluetooth-bluetoothctl >
##
## Script called by: ~/.config/polybar/modules/bluetooth.ini


bluetooth_print() {

    color_enable="#d8dee9"
    color_disable="#555555"

    bluetoothctl | while read -r; do

        if [[ $(bluetooth | grep -c "on") -eq 1 ]]; then

            msg="%{F$color_enable}󰂯"

            devices_connected=$(bluetoothctl devices Connected | cut -d ' ' -f 3-)
            
            if [[ "$devices_connected" = "" ]]; then

                msg+="%{T4} ────%{T-}"
            else
            
                msg+="%{T4}"
                counter=0

                for device in "$devices_connected"; do

                    if [ $counter -gt 0 ]; then

                        msg+=", "
                        msg+="$device"

                    else

                        msg+=" "
                        msg+="$device"
                    fi

                    counter=$((counter + 1))
                done

                msg+="%{T-}"
            fi

            msg+="%{F-}"

            echo "$msg"

        else

            echo "%{F$color_disable}󰂲%{T4} Down%{T-}%{F-}"
        fi

    done
}


bluetooth_toggle() {

    bluetooth toggle
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
