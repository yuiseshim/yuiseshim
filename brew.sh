#HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install emacs
brew cask install google-chrome
brew cask install chromedriver
brew cask install xquartz
brew cask install github
brew cask install texshop
brew cask install aquaskk
brew cask install kindle
brew cask install java
brew cask install lilypond
brew cask install google-backup-and-sync
brew cask install firefox --language=ja
brew cask install mactex
brew cask install libreoffice
brew cask install the-unarchiver
brew cask install slack
brew cask install karabiner-elements
brew cask install google-cloud-sdk
brew cask install tunnelblick
brew cask install gimp
brew cask install firealpaca
brew cask install Tunnelblick

brew tap caskroom/drivers
brew cask install kensington-trackball-works

brew cask install onyx
brew cask install macdown
brew cask install microsoft-office
brew cask install onedrive
brew cask install wkhtmltopdf
brew cask install flash-player
brew cask install box-drive 
brew cask install evernote
brew cask cleanup

brew install zsh-completions zsh-autosuggestions zsh-syntax-highlighting
brew install wget
brew install ghostscript
brew install nkf
# brew install git
brew install svn
brew install pyenv pyenv-virtualenv pyenv-virtualenvwrapper
brew install portaudio
brew install hdf5
brew install mecab mecab-jumandic mecab-ko-dic mecab-unidic-extended mecab-ipadic mecab-ko mecab-unidic
brew install jumanpp
brew install pandoc
brew install graphviz
brew install libxml2
brew install node
brew install libquantum
brew install p7zip
brew install xz # for mecab-ipadic-neologd
brew install imagemagick
brew install tree
brew install node zeromq
brew install cmake
brew install protobuf
brew install bazel
brew install pyqt5
brew install swig
brew install qt  # will install qt-5.x.x
#brew install speedtest-cli
brew install ffmpeg 

brew cleanup
