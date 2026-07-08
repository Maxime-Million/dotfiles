#!/bin/bash

CURRENT=$(powerprofilesctl get)

case "$1" in
    status)
        case "$CURRENT" in
            power-saver)
                echo '{"text": "󰌪", "tooltip": "Mode : Économie d'\''énergie\nCliquer pour changer"}'
                ;;
            balanced)
                echo '{"text": "󰊚", "tooltip": "Mode : Équilibré\nCliquer pour changer"}'
                ;;
            performance)
                echo '{"text": "󰓅", "tooltip": "Mode : Performance\nCliquer pour changer"}'
                ;;
        esac
        ;;
    toggle)
        case "$CURRENT" in
            power-saver)
                powerprofilesctl set balanced
                ;;
            balanced)
                powerprofilesctl set performance
                ;;
            performance)
                powerprofilesctl set power-saver
                ;;
        esac
        pkill -RTMIN+9 waybar
        ;;
esac