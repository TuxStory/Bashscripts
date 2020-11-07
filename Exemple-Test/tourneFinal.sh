#!/bin/bash

#Theme='▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂ ▁'
#Theme='⠁ ⠂ ⠄ ⡀ ⢀ ⠠ ⠐ ⠈'
#Theme='← ↖ ↑ ↗ → ↘ ↓ ↙'
#Theme='- \ | /'
#Theme='┤ ┘ ┴ └ ├ ┌ ┬ ┐'
#Theme='▖ ▘ ▝ ▗'
#Theme='◢ ◣ ◤ ◥'
#Theme='◰ ◳ ◲ ◱'
#Theme='◴ ◷ ◶ ◵'
#Theme="◐ ◓ ◑ ◒"
Theme='⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷'

#Cache le curseur
tput civis

for j in {1..20}
do
  for i in $Theme
  do
    echo -n $i "Processing ..."
    sleep 0.1
    echo -ne "\r"
  done
done

#Active le curseur
tput cvvis

echo "Done             "
