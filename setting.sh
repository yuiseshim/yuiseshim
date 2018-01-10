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
brew cleanup


#xcode-select —install

# AquaSKK
cp /Library/Input\ Methods/AquaSKK.app/Contents/Resources/kana-rule.conf ./Library/

defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

#defaults write com.apple.finder AppleShowAllFiles FALSE
#killall Finder

jupyter notebook --generate-config

# http://users.dimi.uniud.it/~nicola.vitacolonna/software/lilypond-texshop/
wget http://users.dimi.uniud.it/~nicola.vitacolonna/files/LilyPondEngines-2.0.4.tar.gz
tar -zxvf LilyPondEngines-2.0.4.tar.gz
cp ~/LilyPondEngines-2.0.4/*.engine ~/Library/TeXShop/Engines/
