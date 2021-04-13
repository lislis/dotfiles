#! /bin/bash

printf "WELCOME!\n\n"

printf "Checking for updates and upgrading ...\n"

sudo apt-get update > /dev/null

sudo apt-get upgrade -y > /dev/null

printf "Installing first round of packages!"
sudo apt-get install \
     git \
     zsh \
     emacs \
     wget \
     curl \
     vlc \
     openvpn \
     network-manager-openvpn \
     network-manager-openvpn-gnome \
     cmus \
     inkscape \
     gimp \
     krita \
     blender \
     keepassxc \
     calibre \
     steam -y > /dev/null

printf "\nAdding PPAs and updating and installing!\n\n"

sudo add-apt-repository ppa:nextcloud-devs/client -y > /dev/null

sudo apt update > /dev/null

sudo apt-get install \
     nextcloud-client \
     -y > /dev/null

printf "\n\nSo far so good!\n\n"
printf "Next: run 01.sh\n"
