#HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install emacs
brew cask install google-chrome
brew cask install xquartz
brew cask install github
brew cask install texshop
brew cask install aquaskk
brew cask install kindle
brew cask install java
brew cask install lilypond
brew cask install google-backup-and-sync
brew cask install mactex
brew cask install libreoffice
brew cask install the-unarchiver

brew tap caskroom/drivers
brew cask install kensington-trackball-works
brew cask cleanup

brew install wget
brew install ghostscript
brew install nkf
# brew install git
brew install svn
brew install pyenv pyenv-virtualenv
brew install portaudio
brew install hdf5
brew install mecab mecab-jumandic mecab-ko-dic mecab-unidic-extended mecab-ipadic mecab-ko mecab-unidic
brew install pandoc
brew install graphviz
brew install node
brew install p7zip
brew install xz # for mecab-ipadic-neologd
brew install imagemagick
brew cleanup


# python
pyenv install 3.6.4
pyenv virtualenv 3.6.4 tf
pyenv global tf


#xcode-select —install

# AquaSKK
cd ~
cp /Library/Input\ Methods/AquaSKK.app/Contents/Resources/kana-rule.conf ./Library/Application\ Support/AquaSKK/

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
