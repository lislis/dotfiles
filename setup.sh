echo "Welcome to the setup script. Fingers crossed!/n/n"

echo "Check for updates/n/n"
sudo apt update

echo "Addiing ppas/n/n"
sudo add-apt-repository ppa:phoerious/keepassxc
sudo add-apt-repository ppa:nextcloud-devs/client
sudo add-apt-repository ppa:alexlarsson/flatpak

sudo apt update

echo "Installing software packages/n/n"
sudo apt install git zsh emacs terminator flatpak gnome-software-plugin-flatpak clojure openjdk-8-jre ppa-purge wget curl vlc ruby-ffi autoconf libtool postgresql postgresql-contrib libpq-dev libsqlite3-dev -y
sudo apt install cmus clementine inkscape nextcloud-client shutter keepassxc calibre -y

echo "Add flatpak repo/n/n"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Configure git/n"
read -p 'Git user name: ' gituser
read -p 'Git email: ' gitmail
read -p 'Git editor: ' giteditor

git config --global user.name $gituser
git config --global user.email $gitmail
git config --global core.editor $giteditor

echo "generating ssh key/n/n"
read -p 'Email for ssh key: ' sshmail
ssh-keygen -t rsa -b 4096 -C $sshmail

echo "Cloning emacs.d/n/n"
git clone https://github.com/lislis/prelude.git ~/.emacs.d

echo "Installing Rust/n/n"
curl https://sh.rustup.rs -sSf | sh
echo "Rust installed! Don't forget to check out other notes from the script!/n/n"

echo "Installing rbenv/n/n"
# https://github.com/rbenv/rbenv#installation
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo "rbenv is installed but still needs to be configured!!!/n/n"

echo "Installing Node/n/n"
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs
mkdir ~/.npm-packages
npm config set prefix '~/.npm-packages'
echo "Node installed, but check the notes in the script/n/n"
# @todo configure path

# @todo install pip and virtual env

echo "installing oh my zsh/n/n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "/n/nSo far so good!/n/n"
