# Default install
sudo apt-get update
sudo apt-get upgrade
sudo apt-get emacs
sudo apt-get install aptitude
apt-get install tetex-*
apt-get install texlive
apt-get install texlive-lang-cjk
apt-get install xdvik-ja
sudo apt-get install mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8

# Install pyenv-virtual
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev wget curl llvm libncurses5-dev libncursesw5-dev libpng-dev
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo -e "\n# `date '+%Y/%m/%d'` H.Seshime" >> ~/.bashrc
echo "## Setting pyenv, pyenv-virtualenv ##" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc 
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# python virtual env.
pyenv install 3.6.2
pyenv virtualenv 3.6.2 py36
pyenv global py36
pyenv install anaconda3-4.4.0
pyenv virtualenv anaconda3-4.4.0 conda3
pyenv global conda3

# Ubuntu update
cat /etc/lsb-release
lsb_release -d
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade


# Check GPU
lspci | grep -i nvidia
# cuda
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
echo -e "\n# `date '+%Y/%m/%d'` H.Seshime" >> ~/.bashrc
echo "## CUDA and cuDNN paths"  >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-8.0/bin:${PATH}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc
source ~/.bashrc

# cuDNN
# https://developer.nvidia.com/rdp/cudnn-download
# cuDNN v7.0 Runtime Library for Ubuntu16.04 (Deb)
# cuDNN v7.0 Developer Library for Ubuntu16.04 (Deb)
# cuDNN v7.0 Code Samples and User Guide for Ubuntu16.04 (Deb)
# cuDNN v7.0 Library for Linux
# Version 6 in 2017.9.12
# cuDNN v6.0 Runtime Library for Ubuntu16.04 (Deb)
# cuDNN v6.0 Developer Library for Ubuntu16.04 (Deb)
# cuDNN v6.0 Code Samples and User Guide for Ubuntu16.04 (Deb)
# cuDNN v6.0 Library for Linux
# Install Runtime library
sudo dpkg -i libcudnn7_7.0.2.38-1+cuda8.0_amd64.deb
# Install developer library
sudo dpkg -i libcudnn7-dev_7.0.2.38-1+cuda8.0_amd64.deb
# Install code samples and user guide
sudo dpkg -i libcudnn7-doc_7.0.2.38-1+cuda8.0_amd64.deb
tar xzvf cudnn-8.0-linux-x64-v5.1.tgz 
sudo cp -a cuda/lib64/* /usr/local/cuda-8.0/lib64/
sudo cp -a cuda/include/* /usr/local/cuda-8.0/include/
sudo ldconfig

# Remote Access
sudo apt-get install xrdp lxde
echo lxsession -s LXDE -e LXDE > ~/.xsession
#$ sudo vi /etc/xrdp/xrdp.ini
#crypt_levelをlowからhighにする
#xrdp1セクションのport=-1をask=-1にする
gsettings set org.gnome.Vino require-encryption false
sudo service xrdp restart

# SSH
# install Xquartz
ssh -Y hiroyuki_seshime@172.16.1.73

# .bashrc
# alias pipU="pip list --outdated --format=legacy | awk '{print $1}' | xargs pip install -U"

# Javascript
sudo apt-get install npm nodejs
sudo ln -s "$(which nodejs)" /usr/local/bin/node

#Box
#BoxはLinux用クライアントをリリースしていないがwebdavを利用してしてマウントすることができる。ファイルマネージャの「サーバーへ接続」メニューから
#davs://dav.box.com/dav
#gnome-control-center online-accounts

# SDD / HDD
dmesg | tail
sudo apt-get install hfsprogs
sudo fsck.hfsplus -f /dev/sdc2
sudo mount -t hfsplus -o force -rw /dev/sdc2 $HOME
