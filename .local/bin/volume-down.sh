#!/bin/sh

## Detect sink ----

sink=$(pactl get-default-sink)


## Extract current value value ----

current_value=$(pactl get-sink-volume $sink | grep -Po "[0-9]{1,}%" | head -n 1 | cut -d '%' -f 1)
new_value=$(($current_value - 5))


## Increase volume ----

if [[ $new_value -gt 0 ]]; then
    pactl set-sink-volume $sink -5%
else
    pactl set-sink-volume $sink 0%
fi
