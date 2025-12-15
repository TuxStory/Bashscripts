#!/bin/bash

#version 0.1

# Vérifiez que l'utilisateur a fourni les arguments nécessaires
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 'site:example.com' 'text to search'"
    exit 1
fi

# Récupérer les arguments
site="$1"
text="$2"

# Construire l'URL de recherche Google
query=$(echo "$site $text" | sed 's/ /+/g')
url="https://www.google.com/search?q=$query"

# Ouvrir l'URL dans le navigateur par défaut
xdg-open "$url"  # Pour Linux
# open "$url"     # Pour macOS
# start "$url"    # Pour Windows

echo "Recherche effectuée : $url"
