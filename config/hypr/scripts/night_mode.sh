#!/bin/bash

# Récupère l'heure
HOUR=$(date +%-H)

echo "$HOUR"
if [ "$HOUR" -ge 0 ] && [ "$HOUR" -lt 7 ]; then
    # MODE NUIT (Minuit à 7h)
    hyprshade on grayscale
    brightnessctl set 5%
else
    # MODE JOUR
    hyprshade off
fi