sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y emacs

#https://www.expandrive.com/expandrive-for-linux/
#sudo apt install ./ExpanDrive_7.5.0_amd64.deb

curl https://packages.expandrive.com/keys/expandrive.asc | gpg --dearmor > packages.expandrive.gpg
sudo install -o root -g root -m 644 packages.expandrive.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.expandrive.gpg] https://packages.expandrive.com/expandrive stable main" > /etc/apt/sources.list.d/expandrive.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install -y expandrive
