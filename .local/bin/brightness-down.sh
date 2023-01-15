#!/bin/sh

# Set the static decrement value.  Keep in mind that this will
# be done twice.
DecVal=500

# Set the Minimum we will accept.
MinVal=0

# Get the current brightness value.
read -r CurrVal < "/sys/class/backlight/intel_backlight/brightness"

# Set the new value minus the decrement value.
NewVal=$(($CurrVal - $DecVal));

# Set it to the threshold of the min value.
ThresholdVal=$(($NewVal>$MinVal?$NewVal:$MinVal))

# Set the new value directly.
echo -n $ThresholdVal > /sys/class/backlight/intel_backlight/brightness

logger "[ACPI] brightnessdown |$CurrVal| |$NewVal| |$ThresholdVal|"
