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

# API KEY
if [ -f $HOME/Desktop/.bash_mykey ] ; then
    . $HOME/Desktop/.bash_mykey
fi

## Set path for pyenv
export PATH="$PATH:$HOME/.pyenv/shims"
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

export PYTHONPATH=$PYTHONPATH:"$HOME/Desktop"
#export PYTHONPATH=$PYTHONPATH:`pwd`:`pwd`/slim

#PS1=`echo '$PYENV_VERSION'`"|\u@\h \W>$"
