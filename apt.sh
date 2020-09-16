sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y emacs
sudo apt-get install -y openssh-server
sudo apt-get install -y swig

exfs --help 
#https://www.expandrive.com/expandrive-for-linux/
#sudo apt install ./ExpanDrive_7.5.0_amd64.deb
curl https://packages.expandrive.com/keys/expandrive.asc | gpg --dearmor > packages.expandrive.gpg
sudo install -o root -g root -m 644 packages.expandrive.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.expandrive.gpg] https://packages.expandrive.com/expandrive stable main" > /etc/apt/sources.list.d/expandrive.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install -y expandrive

apt-get install tetex-*
apt-get install texlive
apt-get install texlive-lang-cjk
apt-get install xdvik-ja
sudo apt-get install mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8
sudo apt-get install wkhtmltopdf #html2image

# Install pyenv-virtual
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev wget curl llvm libncurses5-dev libncursesw5-dev libpng-dev

######## SKK
sudo apt-get install -y ddskk
sudo apt-get install -y yaskkserv skksearch dbskkd-cdb
sudo apt-get install -y dbskkd-cdb fcitx-skk ibus-skk 
sudo apt-get install -y mlterm-im-skk skksearch skktools skkdic-cdb skkdic-extra uim-skk
sudo apt-get install -y yaskkserv 
sudo apt-get install -y skksearch 
sudo apt-get install -y dbskkd-cdb


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
