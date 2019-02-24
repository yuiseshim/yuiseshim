# http://linuxbrew.sh/
sudo apt-get -y install build-essential curl git python-setuptools ruby file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# 
echo 'PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin":"$PATH"' >>~/.profile

#sudo apt-get -y install gnome-core
#sudo apt-get -y install gnome-panel

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

apt-get update && apt-get install -y bazel
apt-get upgrade bazel

# Google Drive
sudo add-apt-repository ppa:alessandro-strada/ppa
#sudo add-apt-repository ppa:alessandro-strada/google-drive-ocamlfuse-beta
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse
google-drive-ocamlfuse
mkdir ~/GoogleDrive
google-drive-ocamlfuse ~/GoogleDrive
