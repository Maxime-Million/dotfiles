#!/bin/bash

# --- TOGGLE ---
if pgrep -x "rofi" > /dev/null; then
    pkill rofi
    exit 0
fi

# --- CONFIG ---
CACHE_FILE="$HOME/.cache/last_wallpaper_id"
STEAM_DIR="$HOME/.local/share/Steam/steamapps/workshop/content/431960"
PERSO_DIR="$HOME/Images/wallpapers"
ROFI_THEME="$HOME/.config/rofi/wallpaper-grid.rasi"

# --- SCAN OPTIMISÉ ---
ROFI_INPUT=""

# 1. Scan Steam (Plus rapide sans find récursif lourd)
if [ -d "$STEAM_DIR" ]; then
    # On itère directement sur les dossiers pour éviter 'find' global
    for folder in "$STEAM_DIR"/*/; do
        [ -d "$folder" ] || continue
        id=$(basename "$folder")
        
        # On cherche la preview et le project.json sans récursivité
        img="$folder/preview.jpg"
        [ ! -f "$img" ] && img="$folder/preview.png"
        
        title=$id
        ext="pkg" # Par défaut
        if [ -f "$folder/project.json" ]; then
            # Extraction rapide du titre
            title=$(grep -Po '"title"\s*:\s*"\K[^"]*' "$folder/project.json" | head -1)
            # Détection de l'extension principale sans scanner tout le dossier
            file_type=$(grep -Po '"type"\s*:\s*"\K[^"]*' "$folder/project.json" | tail -1 | tr '[:upper:]' '[:lower:]')
            [ "$file_type" == "video" ] && ext="mp4"
            [ "$file_type" == "image" ] && ext="img"
        fi
        
        ROFI_INPUT+="󰓓 $title ($id) .$ext\0icon\x1f$img\n"
    done
fi

# 2. Scan Dossier Personnel (Rapide)
if [ -d "$PERSO_DIR" ]; then
    while read -r img; do
        filename=$(basename "$img")
        ext="${filename##*.}"
        ROFI_INPUT+="󰉏 $filename (perso) .$ext\0icon\x1f$img\n"
    done < <(find "$PERSO_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \))
fi

# --- SELECTION ---
SELECTED_ENTRY=$(echo -e "$ROFI_INPUT" | rofi -no-config -dmenu -i -p "Wallpapers" -theme "$ROFI_THEME")

if [ -n "$SELECTED_ENTRY" ]; then
    # Nettoyage
    pkill mpvpaper 2>/dev/null
    pkill linux-wallpaper 2>/dev/null

    if [[ "$SELECTED_ENTRY" == *"󰉏"* ]]; then
        # CAS PERSO : On extrait le nom proprement
        FILE_NAME=$(echo "$SELECTED_ENTRY" | sed -E 's/󰉏 (.*) \(perso\).*/\1/')
        awww-daemon --format argb &
        echo "AWWW|$PERSO_DIR/$FILE_NAME" > "$CACHE_FILE"
        awww img "$PERSO_DIR/$FILE_NAME" --transition-type grow --transition-pos "$(hyprctl cursorpos)" --transition-duration 1.2 &
    else
        # CAS STEAM : On extrait juste l'ID
        ID=$(echo "$SELECTED_ENTRY" | grep -Po '\(\K[0-9]+')
        TARGET_DIR="$STEAM_DIR/$ID"

        # On vérifie si un .pkg existe pour cet ID
        if find "$TARGET_DIR" -maxdepth 1 -name "*.pkg" | grep -q "."; then
            echo "LWE|$STEAM_DIR/$ID" > "$CACHE_FILE"
            # Correction ici : on passe juste l'ID à linux-wallpaperengine
            pkill awww 2>/dev/null
            linux-wallpaperengine "$STEAM_DIR/$ID" --screen-root "eDP-1" &
        else
            # Sinon média classique
            FINAL_WALL=$(find "$TARGET_DIR" -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.gif" -o -iname "*.jpg" -o -iname "*.png" -o -iname "*.webm" \) | grep -vE "preview|thumb" | head -n 1)

            if [ -n "$FINAL_WALL" ]; then
                if [[ "$FINAL_WALL" =~ \.(mp4|webm|mkv)$ ]]; then
                    echo "MPV|$FINAL_WALL" > "$CACHE_FILE"
                    pkill awww 2>/dev/null
                    pkill linux-wallpaperengine 2>/dev/null
                    mpvpaper -o "no-audio --loop-playlist" '*' "$FINAL_WALL" &
                else
                    awww-daemon --format argb &
                    echo "AWWW|$FINAL_WALL" > "$CACHE_FILE"
                    awww img "$FINAL_WALL" --transition-type grow --transition-pos "$(hyprctl cursorpos)" --transition-duration 1.2 &
                fi
            fi
        fi
    fi
fi
