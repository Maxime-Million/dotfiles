#!/bin/bash

# ID unique pour la notification de batterie
NOTIF_ID=8888

while true; do
    # Récupération du niveau de batterie et du statut (Adapté pour la plupart des PC)
    LEVEL=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [[ "$LEVEL" =~ ^[0-9]+$ ]] && [ "$STATUS" != "Charging" ]; then

        if [ "$LEVEL" -le 5 ]; then
            makoctl dismiss -g "battery_alert" 2>/dev/null
            notify-send -u critical \
                -a "battery_urgent" \
                -h string:x-mako-stack-tag:"battery_alert" \
                "!!! DANGER BATTERIE !!!" "NIVEAU CRITIQUE : $LEVEL%"
            sleep 0.5
            makoctl dismiss -g "battery_alert" 2>/dev/null
            sleep 0.3
            continue

        elif [ "$LEVEL" -le 15 ]; then
            makoctl dismiss -g "battery_alert" 2>/dev/null
            notify-send -u critical \
                -a "battery_notif" \
                -t 0 \
                -h string:x-mako-stack-tag:"battery_alert" \
                --hint=boolean:transient:true \
                "BATTERIE FAIBLE" "<span size='large'>Niveau : </span><b><span color='#f38ba8' size='x-large'>$LEVEL%</span></b>"
            sleep 5
        else
            makoctl dismiss -g "battery_alert" 2>/dev/null
            sleep 5
        fi
    else
        # Si les conditions ne sont plus remplies (branchement ou charge), on supprime la notif
        makoctl dismiss -g "battery_alert" 2>/dev/null
        sleep 60
    fi
done