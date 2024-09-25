#!/bin/bash

# Fonction pour tirer une carte
draw_card() {
    local card=$((RANDOM % 13 + 1))
    if [ $card -gt 10 ]; then
        echo "10"  # Les figures valent 10
    else
        echo "$card"
    fi
}

# Fonction pour calculer la valeur des mains
calculate_hand_value() {
    local total=0
    local aces=0
    for card in "$@"; do
        if [ "$card" -eq 1 ]; then
            aces=$((aces + 1))
            total=$((total + 11))  # Compte l'As comme 11 par défaut
        else
            total=$((total + card))
        fi
    done

    # Ajuster la valeur des As si nécessaire
    while [ $total -gt 21 ] && [ $aces -gt 0 ]; do
        total=$((total - 10))
        aces=$((aces - 1))
    done
    echo $total
}

# Fonction pour afficher les mains
display_hands() {
    echo "Votre main: ${player_hand[@]} (Valeur: $player_value)"
    echo "Main du croupier: ${dealer_hand[0]} ?"
}

# Initialisation des mains et de l'argent
player_hand=()
dealer_hand=()
player_money=100

echo "Bienvenue au Blackjack ! Vous avez $player_money $."

# Boucle principale du jeu
while true; do
    # Demander la mise
    read -p "Combien voulez-vous parier ? " bet
    if ! [[ "$bet" =~ ^[0-9]+$ ]] || [ "$bet" -le 0 ] || [ "$bet" -gt "$player_money" ]; then
        echo "Mise invalide. Veuillez entrer un montant valide."
        continue
    fi

    # Tirer deux cartes pour le joueur et le croupier
    player_hand=($(draw_card) $(draw_card))
    dealer_hand=($(draw_card) $(draw_card))

    # Boucle de jeu
    while true; do
        player_value=$(calculate_hand_value "${player_hand[@]}")
        dealer_value=$(calculate_hand_value "${dealer_hand[@]}")

        display_hands

        if [ $player_value -gt 21 ]; then
            echo "Vous avez dépassé 21 ! Vous avez perdu votre mise de $bet $."
            player_money=$((player_money - bet))
            break
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

    # Si le joueur a perdu, passer à la prochaine main
    if [ $player_value -gt 21 ]; then
        echo "Il vous reste $player_money $."
        if [ $player_money -le 0 ]; then
            echo "Vous n'avez plus d'argent. Merci d'avoir joué !"
            break
        fi
        read -p "Voulez-vous jouer à nouveau ? (o/n) " play_again
        if [[ $play_again != "o" ]]; then
            echo "Merci d'avoir joué !"
            break
        fi
        continue
    fi

    # Tour du croupier
    while [ $dealer_value -lt 17 ]; do
        dealer_hand+=($(draw_card))
        dealer_value=$(calculate_hand_value "${dealer_hand[@]}")
    done

    # Afficher les résultats
    echo "Main du croupier: ${dealer_hand[@]} (Valeur: $dealer_value)"

    if [ $dealer_value -gt 21 ]; then
        echo "Le croupier a dépassé 21 ! Vous avez gagné $bet $ !"
        player_money=$((player_money + bet))
    elif [ $player_value -gt $dealer_value ]; then
        echo "Vous avez gagné $bet $ !"
        player_money=$((player_money + bet))
    elif [ $player_value -lt $dealer_value ]; then
        echo "Vous avez perdu votre mise de $bet $."
        player_money=$((player_money - bet))
    else
        echo "C'est une égalité. Votre mise est retournée."
    fi

    echo "Il vous reste $player_money $."

    # Vérifier si le joueur a encore de l'argent
    if [ $player_money -le 0 ]; then
        echo "Vous n'avez plus d'argent. Merci d'avoir joué !"
        break
    fi

    read -p "Voulez-vous jouer à nouveau ? (o/n) " play_again
    if [[ $play_again != "o" ]]; then
        echo "Merci d'avoir joué !"
        break
    fi
done

