# http://linuxbrew.sh/
sudo apt-get -y install build-essential curl git python-setuptools ruby file
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# 
echo 'PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin":"$PATH"' >>~/.profile

sudo apt-get -y install gnome-core
sudo apt-get -y install gnome-panel

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable



sudo apt-get install xrdp lxde
echo lxsession -s LXDE -e LXDE > ~/.xsession
sudo update-alternatives --config x-session-manager

# English description
LANG=C xdg-user-dirs-gtk-update
#xdg-user-dirs-gtk-update
