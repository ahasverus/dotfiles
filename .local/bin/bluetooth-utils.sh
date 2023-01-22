#!/bin/sh

bt () {

    if [ "$1" = "on" ]; then
        action="connect"
    else
        action="disconnect"
    fi

    case $2 in
        "black") device='F8:4E:17:73:78:4F';;
        "white") device='F8:4E:17:E6:ED:6D';;
        "bose") device='60:AB:D2:27:D1:76';;
    esac

    bluetoothctl $action $device
}
