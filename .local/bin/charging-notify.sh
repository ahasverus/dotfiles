#!/bin/sh

export DISPLAY=:0
export XAUTHORITY=/home/archie/.Xauthority
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Pass 1 as an argument for charging, 0 for discharging
BATTERY_CHARGING=$1
BATTERY_LEVEL=`acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)'`

if [ ${BATTERY_LEVEL} -le 30 ]; then
    icon="0"
elif [ ${BATTERY_LEVEL} -gt 30 ] && [ ${BATTERY_LEVEL} -le 50 ]; then
    icon="1"
elif [ ${BATTERY_LEVEL} -gt 50 ] && [ ${BATTERY_LEVEL} -le 70 ]; then
    icon="2"
elif [ ${BATTERY_LEVEL} -gt 70 ] && [ ${BATTERY_LEVEL} -le 90 ]; then
    icon="3"
else
    icon="charging"
fi

# Send notifications
if [ $BATTERY_CHARGING -eq 1 ]; then
    notify-send "Charging" "${BATTERY_LEVEL}% of battery charged" -u normal -i battery-charging -t 5000 -r 9991
elif [ $BATTERY_CHARGING -eq 0 ]; then
    notify-send "Unplugged" "${BATTERY_LEVEL}% of battery remaining" -u normal -i battery-${icon} -t 5000 -r 9991
fi
