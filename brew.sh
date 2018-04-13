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
brew install tree
brew cleanup
