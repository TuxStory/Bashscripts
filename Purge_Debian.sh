#!/bin/bash

echo -e "\033[01;32m>>> \033[00mRecherche de résidus ... "
[[ $(dpkg -l | grep ^rc) ]] && sudo dpkg -P $(dpkg -l | awk '/^rc/{print $2}') || echo "Aucun résidu trouvé."
