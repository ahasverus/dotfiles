
#!/bin/sh

## Detect sink ----

sink=$(pactl get-default-sink)


## Mute / Unmute speakers ----

pactl set-sink-mute $sink toggle
