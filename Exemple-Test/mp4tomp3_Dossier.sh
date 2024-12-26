#!/bin/bash
#chatgpt

# Vérifiez si un dossier a été fourni en argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <dossier>"
    exit 1
fi

# Dossier contenant les fichiers MP4
dossier="$1"

# Vérifiez si le dossier existe
if [ ! -d "$dossier" ]; then
    echo "Le dossier '$dossier' n'existe pas."
    exit 1
fi

# Parcourez tous les fichiers MP4 dans le dossier
for fichier in "$dossier"/*.mp4; do
    # Vérifiez si le fichier existe
    if [ -e "$fichier" ]; then
        # Obtenez le nom de base du fichier sans l'extension
        nom_fichier=$(basename "$fichier" .mp4)
        # Convertissez le fichier MP4 en MP3
        ffmpeg -i "$fichier" -q:a 0 "$dossier/$nom_fichier.mp3"
        echo "Converti: $fichier -> $dossier/$nom_fichier.mp3"
    else
        echo "Aucun fichier MP4 trouvé dans le dossier."
    fi
done

