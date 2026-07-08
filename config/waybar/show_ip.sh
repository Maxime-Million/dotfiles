#!/bin/bash

STATE=/tmp/waybar_ip_click_time
DELAY=5  # secondes pendant lesquelles l'IP réelle reste visible après un clic

case "$1" in
    click)
        date +%s > "$STATE"
        ;;
esac

if [ -f "$STATE" ]; then
    CLICK_TIME=$(cat "$STATE")
    NOW=$(date +%s)
    ELAPSED=$((NOW - CLICK_TIME))

    if [ "$ELAPSED" -lt "$DELAY" ]; then
        IP=$(ip route get 1.1.1.1 2>/dev/null | grep -oP 'src \K\S+' || echo "indisponible")
        echo "$IP"
        exit 0
    fi
fi

echo "xxx.xxx.xxx.xxx"