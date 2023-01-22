#!/bin/sh

BATTERY_LEVEL=`acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)'`

dunstify "BATTERY LEVEL" "${BATTERY_LEVEL}% of battery remaining." -i battery-3 -u low -r 9991
