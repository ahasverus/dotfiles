#!/bin/sh

# Set the static increment value.  Keep in mind that this will
# be done twice.
IncVal=500

# Get the Maximum value for use.
read -r MaxVal < "/sys/class/backlight/intel_backlight/max_brightness"

# Get the current brightness value.
read -r CurrVal < "/sys/class/backlight/intel_backlight/brightness"

# Set the new value minus the decrement value.
NewVal=$(($CurrVal + $IncVal));

# Set it to the threshold of the max value.
ThresholdVal=$(($NewVal<$MaxVal?$NewVal:$MaxVal))

# Set the new value directly.
echo -n $ThresholdVal > /sys/class/backlight/intel_backlight/brightness

logger "[ACPI] brightnessup |$CurrVal| |$NewVal| |$ThresholdVal|"
