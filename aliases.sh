########################
# Exemples d'alias     #
# Debian .bash_aliases #
# Date :	2025   #
# Version :	0.9.4  #
########################

#### shortcuts & commands ##########
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias hl='history | less'
alias bye='sudo shutdown -h now'
alias al='alias'
alias ip='ip -c a'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -hl'
alias ls='ls --color=auto'
alias ncdu='ncdu --color dark'
alias bat='batcat'
alias error='journalctl -b -p err'
alias untar='tar -zxvf '
alias ipe='curl ipinfo.io/ip'
alias IPE='curl ipinfo.io'
alias clearswap='sudo swapoff -a && sudo swapon -a'
alias timestamp='date +%Y-%m-%dT%H-%M-%S'

#### MAJ Debian ############
alias MAJ='sudo apt update -y && sudo apt upgrade -y'
alias BigMAJ='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove'
alias REM='sudo apt autoremove -y'

#### from ohmybash ###########
alias apup='sudo apt update'
alias apug='sudo apt upgrade'
alias apuu='sudo apt update && sudo apt upgrade'
alias apfu='sudo apt full-upgrade'

#### APT
alias apin='sudo apt install'
alias apri='sudo apt install --reinstall'
alias aprm='sudo apt remove'
alias apur='sudo apt purge'
alias apar='sudo apt autoremove'
alias apcl='sudo apt-get autoclean'

alias apse='apt search'
alias apsh='apt show'
alias apsc='apt-get source'
alias apesr='sudo apt edit-sources'
alias apdl='apt-get download'
alias apbd='sudo apt build-deb'
alias aphst='cat /var/log/apt/history.log | less'

alias drcf='sudo dpkg-reconfigure'

#### Grub & initramfs ###########
alias upgrb='sudo update-grub'
alias uirfs='sudo update-initramfs -u'

#### DNF Aliases ###########
alias dnfins='sudo dnf install'
alias dnfrm='sudo dnf remove'
alias dnfup='sudo dnf update -y' # update is an alias for upgrade in dnf
alias dnfsearch='dnf search'
alias dnfgrplst='dnf group list'
alias dnfgrpins='sudo dnf group install'
alias dnfautoclean='sudo dnf autoremove'

#### Arch Linux ###########
alias Up='sudo pacman -Suy'
alias ListOrph='sudo pacman -Qdt'
alias rmb='sudo pacman -Rns $(pacman -Qdtq)'
alias paci='sudo pacman -S '
alias pacr='sudo pacman -r '

#### Fun ############
alias yep='sudo apt install $1'
alias nop='sudo apt remove $1'
alias whatsup='service --status-all'
alias hello='sudo /etc/init.d/apache2 stop && cd workspace/project && ddev start && ddev launch'
alias hi='sudo systemctl stop apache2'
alias ports='nmap localhost'
alias dens="sudo systemd-resolve --status | grep 'DNS Servers'"
alias iad='systemctl is-active docker'
alias bye='shutdown -r now'
alias lt='ls --human-readable --size -1 -S --classify'
alias lu='du -sh * | sort -h'
alias lt='ls -t -1 -long'
alias lc='find . -type f | wc -l'

###############################################################################
