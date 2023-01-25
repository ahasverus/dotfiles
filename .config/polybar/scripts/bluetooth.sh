#!/bin/sh

blue_status=$(bluetooth | grep -c "on")

if [[ blue_status -eq 1 ]]
then
    echo "%{F#d8dee9}󰂯%{T4} On %{T-}%{F-}"
else
    echo "%{F#555555}󰂲%{T4} Off %{T-}%{F-}"
fi
