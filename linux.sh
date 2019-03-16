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
source ~/.bashrc
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

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



sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo reboot
sudo do-release-upgrade

sudo ubuntu-drivers autoinstall

# tensorflow-gpu
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64' >> ~/.bashrc

# Add NVIDIA package repositories
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt-get update
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt install ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
sudo apt-get update

# Install NVIDIA driver
sudo apt-get install --no-install-recommends nvidia-driver-410
# Reboot. Check that GPUs are visible using the command: nvidia-smi

# Install development and runtime libraries (~4GB)
sudo apt-get install --no-install-recommends cuda-10-0 libcudnn7=7.4.1.5-1+cuda10.0 libcudnn7-dev=7.4.1.5-1+cuda10.0


# Install TensorRT. Requires that libcudnn7 is installed above.
sudo apt-get update && sudo apt-get install nvinfer-runtime-trt-repo-ubuntu1804-5.0.2-ga-cuda10.0 && sudo apt-get update && sudo apt-get install -y --no-install-recommends libnvinfer-dev=5.0.2-1+cuda10.0
