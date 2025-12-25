#!/bin/bash

options="poweroff\nreboot\nhyprexit\nhyprlock"

chosen=$(echo -e "$options" | wofi --dmenu -p "" -W 300 -H 250)

case "$chosen" in
    "poweroff")
        systemctl poweroff
        ;;
    "reboot")
        systemctl reboot
        ;;
    "hyprexit")
        hyprctl dispatch exit
        ;;
    "hyprlock")
        hyprlock
        ;;
esac
