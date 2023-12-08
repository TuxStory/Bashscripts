#!/bin/sh

zenity --list \
  --title="Choisissez les bogues à afficher" \
  --column="N° de bogue" --column="Gravité" --column="Description" \
    992383 Normal "GtkTreeView plante lors de sélections multiples" \
    293823 Grave "Le dictionnaire GNOME ne prend pas de proxy en charge" \
    393823 Critique "L'édition de menu ne fonctionne pas avec GNOME 2.0"
