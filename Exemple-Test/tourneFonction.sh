#!/bin/bash

apt search linux &
pid=$!

# If this script is killed, kill the `cp'.
trap "kill $pid 2> /dev/null" EXIT

# While copy is running...
while kill -0 $pid 2> /dev/null; do
    # Do something
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

      while true
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
        #sleep 1
    done

# Disable the trap on a normal exit.
trap - EXIT
