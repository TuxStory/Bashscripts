#!/bin/bash

#https://gist.github.com/joseluisq/d0e66c5f718250c90075
#Disable Git gnome-ssh-askpass on RedHat related OS (Fedora, CentOS)
#1.- Add these lines to ~/·bashrc or ~/.zshrc file :

[ -n "$SSH_CONNECTION" ] && unset SSH_ASKPASS
export GIT_ASKPASS=

#2.- Update source files:
#$ source ·bashrc
#// Or
#$ source .zshrc
