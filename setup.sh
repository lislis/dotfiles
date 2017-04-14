echo "Welcome to the setup script. Fingers crossed!"

echo "Check for updates"
sudo apt-get update

echo "Installing git and zsh emacs"
sudo apt-get install git zsh emacs --y

echo "Configure git"
read -p 'Git user name: ' gituser
read -p 'Git email: ' gitmail
read -p 'Git editor: ' giteditor

git config --global user.name gituser
git config --global user.email gitmail
git config --global core.editor giteditor

echo "generating ssh key"
read -p 'Email for ssh key: ' sshmail
ssh-keygen -t rsa -b 4096 -C sshmail

echo "installing more packages"
sudo apt-get install terminator cmus clementine owncloud-client shutter keepassx openjdk-8-jre calibre ppa-purge --y

echo "so far so good"
