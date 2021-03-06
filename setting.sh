# python
pyenv install 3.6.4
pyenv virtualenv 3.6.4 tf
pyenv global tf


#xcode-select —install

# AquaSKK
cd ~
cp /Library/Input\ Methods/AquaSKK.app/Contents/Resources/kana-rule.conf ./Library/Application\ Support/AquaSKK/
curl https://raw.githubusercontent.com/yuiseshim/yuiseshim/master/AquaSKK/kana-rule.conf > ./Library/Application\ Support/AquaSKK/kana-rule.conf
curl https://raw.githubusercontent.com/yuiseshim/yuiseshim/master/AquaSKK/skk-jisyo.utf8 > ./Library/Application\ Support/AquaSKK/skk-jisyo.utf8

defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

#defaults write com.apple.finder AppleShowAllFiles FALSE
#killall Finder

jupyter notebook --generate-config

# http://users.dimi.uniud.it/~nicola.vitacolonna/software/lilypond-texshop/
wget http://users.dimi.uniud.it/~nicola.vitacolonna/files/LilyPondEngines-2.0.4.tar.gz
tar -zxvf LilyPondEngines-2.0.4.tar.gz
cp ~/LilyPondEngines-2.0.4/*.engine ~/Library/TeXShop/Engines/

# Mecab
cd ~/Downloads
git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
cd mecab-ipadic-neologd
./bin/install-mecab-ipadic-neologd -n

# apple app update
# brew tap buo/cask-upgrade
# brew cu

# Python
python -m bash_kernel.install

# 「すべてのアプリケーションを許可」の設定を復活させる
#sudo spctl –master-disable #「すべてのアプリケーションを許可」
#sudo spctl –master-enable #戻す

# Screen Shot
defaults write com.apple.screencapture name ScreenShot
defaults write com.apple.screencapture type jpg
mkdir ~/ScreenShot
defaults write com.apple.screencapture location ~/ScreenShot/
killall SystemUIServer


npm install -g electron@1.8.4 orca # plotly

defaults write com.apple.screencapture location ~/ScreenShots
#defaults delete com.apple.screencapture location
killall SystemUIServer
