echo "Welcome to the setup script. Fingers crossed!"

echo "Check for updates"
sudo apt-get update

echo "Addiing ppas"
sudo add-apt-repository ppa:phoerious/keepassxc

sudo apt-get update

echo "Installing software packages"
sudo apt-get install git zsh emacs terminator cmus clementine owncloud-client shutter keepassxc clojure openjdk-8-jre calibre ppa-purge wget -y

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

echo "Cloning spezi theme"
wget -o ~/.oh-my-zsh/custom/themes/spezi.zsh-theme "https://gist.githubusercontent.com/lislis/0be6da335835de6af7bae92e70b7901f/raw/657a2e46379badc197d484cf46492467ce4dfac7/spezi.zsh-theme"

echo "so far so good"
