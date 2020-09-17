# Install pyenv-virtual
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

echo -e "\n# `date '+%Y/%m/%d'` $USER" >> ~/.profile
echo "## Setting pyenv, pyenv-virtualenv ##" >> ~/.profile
echo 'export PATH="$PATH:$HOME/.pyenv/shims"' >> ~/.profile
echo 'export PYENV_ROOT="${HOME}/.pyenv"' >> ~/.profile
echo 'if [ -d "${PYENV_ROOT}" ]; then' >> ~/.profile
echo '  export PATH=${PYENV_ROOT}/bin:$PATH'
echo '  eval "$(pyenv init -)"' >> ~/.profile
echo '  eval "$(pyenv virtualenv-init -)"' >> ~/.profile
echo 'fi\n' >> ~/.profile
echo 'export PYTHONPATH="$HOME/Desktop"' >> ~/.profile
source ~/.bashrc

# python virtual env.
pyenv install 3.8.3
pyenv virtualenv 3.8.3 py38
pyenv global py38
