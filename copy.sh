echo "Copying spezi theme"
# "https://gist.githubusercontent.com/lislis/0be6da335835de6af7bae92e70b7901f"
mkir -p ~/.oh-my-zsh/custom/themes
cp spezi.zsh-theme ~/.oh-my-zsh/custom/themes/spezi.zsh-theme 

echo "Copying .zshrc"
cp .zshrc ~/.zshrc

echo "so far so good!"
