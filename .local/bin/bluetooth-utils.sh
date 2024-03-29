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
        "quiet")  device='60:AB:D2:B2:B6:D3';;
        "mxkeys") device='D4:F5:72:09:48:51';;
	"marshall") device='04:21:44:8A:9A:85';;
	"major") device='1C:6E:4C:7F:58:83';;
    esac

    bluetoothctl $action $device
}
