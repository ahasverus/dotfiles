#!/bin/sh

## Display Wireless status in Polybar (Down / On / Network name)
##
## Modified from: https://github.com/polybar/polybar-scripts/
## Original script: < network-networkmanager >
##
## Script called by: ~/.config/polybar/modules/wlan.ini


wifi_print() {

    color_enable="#d8dee9"
    color_disable="#555555"

    if [[ $(wifi | grep -c "on") -eq 1 ]]; then

        msg="%{F$color_enable}%{T1}󰤨%{T-}"

        network_connected=$(nmcli connection show | grep "wlp" | cut -d ' ' -f 1)
        
        if [[ "$network_connected" = "" ]]; then

            msg+="%{T4} ────%{T-}"

        else
        
            msg+="%{T4}"
            msg+=" "
            msg+="$network_connected"
            msg+="%{T-}"
        fi

        msg+="%{F-}"

        echo "$msg"

    else

        echo "%{F$color_disable}%{T1}󰤭%{T-}%{T4} Down%{T-}%{F-}"
    fi
}


trap exit INT

while true; do
    wifi_print

    timeout 60s nmcli monitor | while read -r; do
        wifi_print
    done &

    wait
done
