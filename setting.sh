#HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install emacs
#brew cask install google-chrome
brew cask install google-drive
brew cask install xquartz
brew cask install github
brew cask install texshop
brew cask cleanup

brew install ghostscript
brew install nkf
brew install git svn wget
brew install pyenv pyenv-virtualenv
brew cleanup


xcode-select —install
