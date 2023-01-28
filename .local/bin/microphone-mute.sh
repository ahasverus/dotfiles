#!/bin/sh

## Detect sink ----

sink=$(pactl get-default-source)


## Mute / Unmute speakers ----

pactl set-source-mute $sink toggle
