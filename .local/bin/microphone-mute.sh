#!/bin/sh

## Detect sink ----

sink=$(pactl get-default-source)


## Mute / Unmute microphone ----

pactl set-source-mute $sink toggle
