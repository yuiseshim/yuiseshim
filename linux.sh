# http://linuxbrew.sh/
sudo apt-get -y install build-essential curl git python-setuptools ruby file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# 
echo 'PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin":"$PATH"' >>~/.profile

#sudo apt-get -y install gnome-core
#sudo apt-get -y install gnome-panel

########
sudo apt-get install -y ddskk dbskkd-cdb fcitx-skk ibus-skk mlterm-im-skk skksearch skktools skkdic-cdb skkdic-extra uim-skk yaskkserv
sudo apt-get install -y swig

# Install pyenv-virtual
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev wget curl llvm libncurses5-dev libncursesw5-dev libpng-dev
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
echo -e "\n# `date '+%Y/%m/%d'` H.Seshime" >> ~/.bashrc
echo "## Setting pyenv, pyenv-virtualenv ##" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc 
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrcgit clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

# python virtual env.
pyenv install 3.6.7
pyenv virtualenv 3.6.7 tfgpu
pyenv global tfgpu

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

sudo apt-get install -y nodejs npm # plotly
npm install -g electron@1.8.4 orca

sudo apt-get install xrdp lxde
echo lxsession -s LXDE -e LXDE > ~/.xsession
sudo update-alternatives --config x-session-manager

# English description
LANG=C xdg-user-dirs-gtk-update
#xdg-user-dirs-gtk-update

###### bazel #########
apt-get update
apt-get install -y openjdk-8-jdk

echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

sudo apt-get update && sudo apt-get install -y bazel
sudo apt-get upgrade bazel


# Mecab
sudo apt-get -y install mecab libmecab-dev mecab-ipadic-utf8 mecab-ipadic
sudo apt-get -y install juman juman-dic libjuman4 mecab-jumandic
cd ~/Downloads
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n

# Google Drive
sudo add-apt-repository ppa:alessandro-strada/ppa
#sudo add-apt-repository ppa:alessandro-strada/google-drive-ocamlfuse-beta
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
google-drive-ocamlfuse
mkdir ~/GoogleDrive
google-drive-ocamlfuse ~/GoogleDrive
