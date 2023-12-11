#!/bin/bash

#INPUT=addr.csv
#OLDIFS=$IFS
#IFS=","

zenity --list \
  --width=800 --height=450 --text "Contacts" \
  --column "Prenom" --column "Nom"  --column "Courriel" \
  --column "Adresse" --column "Numero" --column "Ville" --column "Anniversaire" \
  John Doe john.doe@gmail.com "Peace Street" 43 London 07/12/75 \
  Alexia Doe alexia.doe@gmail.com "Bakker Street" 523 London 14/04/72 \
  Arold Finch arold_finch@microsoft.com "Machine Street" 824 "New York" 23/05/68 \
  Rose Cobelpot RosePot@yahoo.fr "Rue du dolmen" 27 Salzbourg 12/08/2006 \
  Rodolph White RodWhite54@hotmail.com "Avenue des coeurs" 45 Paris 01/03/85 \
  Julie Mortel MissJu@caramail.com "Rue de la Paix" 93 Toulouse 27/07/93 \
  Max Vanderbrug MaxV87@aol.com "Morgen Straat" 45 Gent 17/02/44 \
  Marie McMaan MMs@facebook.com "Glory Street" 2084 "Los Angeles" 25/04/78 \
  Robert Patoulachi SuperCop@inconnu.com "Avenue de la Justice" 37 Bruxelles 45/05/02
