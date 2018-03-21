echo "Welcome to the setup script. Fingers crossed!"

echo "Check for updates"
sudo apt update

echo "Addiing ppas"
sudo add-apt-repository ppa:phoerious/keepassxc
sudo add-apt-repository ppa:nextcloud-devs/client

sudo apt update

echo "Installing software packages"
sudo apt install git zsh emacs terminator clojure openjdk-8-jre ppa-purge wget curl vlc ruby-ffi autoconf libtool postgresql postgresql-contrib libpq-dev libsqlite3-dev -y
sudo apt install cmus clementine inkscape nextcloud-client shutter keepassxc calibre -y


echo "Configure git"
read -p 'Git user name: ' gituser
read -p 'Git email: ' gitmail
read -p 'Git editor: ' giteditor

git config --global user.name $gituser
git config --global user.email $gitmail
git config --global core.editor $giteditor

echo "generating ssh key"
read -p 'Email for ssh key: ' sshmail
ssh-keygen -t rsa -b 4096 -C $sshmail

echo "Cloning emacs.d"
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

echo "installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "so far so good!"
