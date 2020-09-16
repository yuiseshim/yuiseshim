# Install pyenv-virtual
git clone https://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo -e "\n# `date '+%Y/%m/%d'` H.Seshime" >> ~/.bashrc
echo "## Setting pyenv, pyenv-virtualenv ##" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc 
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc 
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

# python virtual env.
pyenv install 3.8.3
pyenv virtualenv 3.8.3 py38
pyenv global py38
