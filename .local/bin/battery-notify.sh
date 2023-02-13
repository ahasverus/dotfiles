#!/bin/sh

export DISPLAY=:0
export XAUTHORITY=/home/nicolas/.Xauthority
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Battery percentage at which to notify
WARNING_LEVEL=25
BATTERY_FULL_LEVEL=80
BATTERY_DISCHARGING=`acpi -b | grep "Battery 0" | grep -c "Discharging"`
BATTERY_LEVEL=`acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)'`

# Use two files to store whether we've shown a notification or not (to prevent multiple notifications)
EMPTY_FILE=/tmp/batteryempty
FULL_FILE=/tmp/batteryfull

# Reset notifications if the computer is charging/discharging
if [ $BATTERY_DISCHARGING -eq 1 ] && [ -f $FULL_FILE ]; then
    rm $FULL_FILE
elif [ $BATTERY_DISCHARGING -eq 0 ] && [ -f $EMPTY_FILE ]; then
    rm $EMPTY_FILE
fi

# If the battery is charging and is full (and has not shown notification yet)
if [ $BATTERY_LEVEL -gt $BATTERY_FULL_LEVEL ] && [ $BATTERY_DISCHARGING -eq 0 ] && [ ! -f $FULL_FILE ]; then
    /usr/bin/dunstify "BATTERY CHARGED" "Battery is fully charged." -u low -i battery-3 -r 9991
    touch $FULL_FILE
# If the battery is low and is not charging (and has not shown notification yet)
elif [ $BATTERY_LEVEL -le $WARNING_LEVEL ] && [ $BATTERY_DISCHARGING -eq 1 ] && [ ! -f $EMPTY_FILE ]; then
    /usr/bin/dunstify "BATTERY LOW" "${BATTERY_LEVEL}% of battery remaining." -i battery-0 -u critical -r 9991
    touch $EMPTY_FILE
fi
