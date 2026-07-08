#!/bin/bash

# Dossier pour stocker l'état
FILE="/tmp/hypr_state_$1"

ICON_CAPS_ON="/home/maxime/.config/hypr/assets/keyboard-caps-locked.svg"
ICON_CAPS_OFF="/home/maxime/.config/hypr/assets/keyboard-caps-disabled.svg"
ICON_NUM_ON="/home/maxime/.config/hypr/assets/object-locked.svg"
ICON_NUM_OFF="/home/maxime/.config/hypr/assets/object-unlocked.svg"

if [ -f "$FILE" ]; then
    rm "$FILE"
    STATUS="<b><span color='#fab387'>DÉSACTIVÉ</span></b>"
    [ "$1" == "caps" ] && ICON=$ICON_CAPS_OFF || ICON=$ICON_NUM_OFF
else
    touch "$FILE"
    STATUS="<b><span color='#b3fa87'>ACTIVÉ</span></b>"
    [ "$1" == "caps" ] && ICON=$ICON_CAPS_ON || ICON=$ICON_NUM_ON
fi

# Configuration du nom à afficher
[ "$1" == "caps" ] && LABEL="Maj. Lock" || LABEL="Num. Lock"

# Envoi de la notification (l'option stack-tag évite le spam)
notify-send -t 800 \
    -a "Clavier" \
    -h string:x-dunst-stack-tag:"$1" \
    --hint=boolean:transient:true \
    -i "$ICON" \
    "$LABEL" "$STATUS"