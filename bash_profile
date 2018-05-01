# .bash_profile
# by login

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# Setting Japanese Font                                                                             
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

#Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=emacs

#export HOMEBREW_NO_ANALYTICS=1
#export HOMEBREW_CASK_OPTS=“–appdir=/Applications”

## Set path for pyenv
export PATH="$PATH:$HOME/.pyenv/shims"
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export PYTHONPATH="$HOME/Google ドライブ/mysetting"

# Automatically update
#brew update && brew upgrade && brew doctor
