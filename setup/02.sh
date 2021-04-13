#! /bin/bash

printf "Almost done!\n"
printf "Copying zsh theme and zshrc!"

mkdir -p ~/.oh-my-zsh/custom/themes/
cp ./zsh/spezi.zsh-theme ~/.oh-my-zsh/themes/spezi.zsh-theme
cp ./zsh/.zshrc ~/.zshrc

printf "\nDone!\n\n"
