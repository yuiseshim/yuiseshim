#HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install emacs
brew cask install google-chrome
brew cask install google-drive
brew cask cleanup

brew install nkf
brew install git svn wget
brew cleanup


xcode-select —install
