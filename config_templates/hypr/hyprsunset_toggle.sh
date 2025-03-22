#!/usr/bin/env bash

if pgrep hyprsunset >/dev/null; then
    if [ "$1" = "toggle" ]; then
        pkill hyprsunset
        notify-send -t 700 "Hyprsunset stopped"
        echo "Hyprsunset toggle: stopped"
        pkill -SIGRTMIN+10 waybar
    else
        echo "󱩌"
    fi
else
    if [ "$1" = "toggle" ]; then
        hyprsunset --temperature 5000 &
        notify-send -t 700 "Hyprsunset started"
        echo "Hyprsunset toggle: started"
        pkill -SIGRTMIN+10 waybar
    else
        echo "󰹏"
    fi
fi
