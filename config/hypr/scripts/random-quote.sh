#!/bin/bash

# Chemin vers ton fichier de phrases
QUOTE_FILE="$HOME/.config/hypr/quotes.txt"

# Vérifie si le fichier existe, sinon affiche un message par défaut
if [ ! -f "$QUOTE_FILE" ]; then
    echo "Bienvenue Maxime"
    exit 0
fi

# Lit le fichier et choisit une ligne aléatoire
shuf -n 1 "$QUOTE_FILE"