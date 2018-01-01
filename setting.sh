#HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install emacs
brew cask install google-chrome
#brew cask install google-drive
brew cask install xquartz
brew cask install github
brew cask install texshop
brew cask install aquaskk
brew cask install kindle
brew cask install java
brew cask install lilypond

brew tap caskroom/drivers
brew cask install kensington-trackball-works
brew cask cleanup

brew install wget
brew install ghostscript
brew install nkf
brew install git svn wget
brew install pyenv pyenv-virtualenv
brew install portaudio
brew install hdf5
brew install mecab mecab-jumandic mecab-ko-dic mecab-unidic-extended mecab-ipadic mecab-ko mecab-unidic
brew install pandoc
brew install graphviz
brew install node
brew cleanup


#xcode-select —install

defaults write com.apple.finder AppleShowAllFiles TRUE
#killall Finder
