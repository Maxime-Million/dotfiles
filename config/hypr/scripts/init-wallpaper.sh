#!/bin/bash

CACHE_FILE="$HOME/.cache/last_wallpaper_id"

pkill awww 2>/dev/null
# Vérifie si le fichier de cache existe
if [ -f "$CACHE_FILE" ]; then
    # On sépare le TYPE du CHEMIN (séparateur |)
    TYPE=$(cut -d'|' -f1 "$CACHE_FILE")
    PATH_ID=$(cut -d'|' -f2 "$CACHE_FILE")

    case $TYPE in
        LWE)
            linux-wallpaperengine "$STEAM_DIR/$PATH_ID" --screen-root "eDP-1" &
            ;;
        MPV)
            mpvpaper -o "no-audio --loop-playlist" '*' "$PATH_ID"
            ;;
        AWWW)
            awww-daemon --format argb &
            awww img "$PATH_ID"
            ;;
    esac
else
    awww-daemon --format argb &
    # Optionnel : Un wallpaper par défaut si aucun ID n'est stocké
    awww img /home/maxime/Images/fond\ d\'ecran/4k-ai-mountain.jpg
fi