#! /bin/bash

printf "Configuring git!\n\n"

read -p "Git user name: " gituser
read -p "Git email: " gitmail

git config --global user.name $gituser
git config --global user.email $gitmail
git config --global core.editor "emacsclient -nc"

printf "\nGenerating ssh key!\n\n"

read -p "Identifier for ssh key: " sshmail
mkdir -p ~/.ssh && \
    ssh-keygen -t ed25519 -o -a 100 \
               -f ~/.ssh/id_ed25519 \
               -C $sshmail \
               > /dev/null

printf "\nCloning emacs.d\n\n"

git clone https://github.com/lislis/prelude.git ~/.emacs.d > /dev/null

printf "\nInstalling zsh, after that run 02.sh\n\n"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
