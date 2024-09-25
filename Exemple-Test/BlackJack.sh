#!/bin/bash

# Fonction pour tirer une carte
draw_card() {
    echo $((RANDOM % 10 + 1))
}

# Fonction pour calculer la valeur des mains
calculate_hand_value() {
    local total=0
    for card in "$@"; do
        total=$((total + card))
    done
    echo $total
}

# Fonction pour afficher les mains
display_hands() {
    echo "Votre main: ${player_hand[@]} (Valeur: $player_value)"
    echo "Main du croupier: ${dealer_hand[@]} (Valeur: $dealer_value)"
}

# Initialisation des mains
player_hand=()
dealer_hand=()

# Tirer deux cartes pour le joueur et le croupier
for i in {1..2}; do
    player_hand+=($(draw_card))
    dealer_hand+=($(draw_card))
done

# Boucle de jeu
while true; do
    player_value=$(calculate_hand_value "${player_hand[@]}")
    dealer_value=$(calculate_hand_value "${dealer_hand[@]}")

    display_hands

    if [ $player_value -gt 21 ]; then
        echo "Vous avez dépassé 21 ! Vous avez perdu."
        exit 0
    fi

    read -p "Voulez-vous tirer une carte (t) ou rester (r) ? " choice
    if [[ $choice == "t" ]]; then
        player_hand+=($(draw_card))
    elif [[ $choice == "r" ]]; then
        break
    else
        echo "Choix invalide. Veuillez entrer 't' ou 'r'."
    fi
done

# Tour du croupier
while [ $dealer_value -lt 17 ]; do
    dealer_hand+=($(draw_card))
    dealer_value=$(calculate_hand_value "${dealer_hand[@]}")
done

# Afficher les résultats
display_hands

if [ $dealer_value -gt 21 ]; then
    echo "Le croupier a dépassé 21 ! Vous avez gagné !"
elif [ $player_value -gt $dealer_value ]; then
    echo "Vous avez gagné !"
elif [ $player_value -lt $dealer_value ]; then
    echo "Vous avez perdu."
else
    echo "C'est une égalité."
fi
