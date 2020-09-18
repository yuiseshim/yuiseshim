echo 'export PYTHONPATH="$HOME/Desktop"' >> ~/.profile
echo -e '\n'

echo '# ALIAS' >> ~/.profile
echo 'if [ -f "$HOME/.bash_alias" ]; then' >> ~/.profile
echo '  . "$HOME/.bash_alias"' >> ~/.profile
echo 'fi' >> ~/.profile
echo -e '\n'

echo '# API KEY' >> ~/.profile
echo 'if [ -f "$HOME/.bash_mykey" ] ; then' >> ~/.profile
echo '  . "$HOME/.bash_mykey"' >> ~/.profile
echo 'fi' >> ~/.profile
echo -e '\n'
