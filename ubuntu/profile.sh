echo '# ALIAS' >> ~/.profile
echo 'if [ -f "$HOME/.bash_alias" ]; then' >> ~/.profile
echo '  . "$HOME/.bash_alias"' >> ~/.profile
echo 'fi' >> ~/.profile

echo 'export PYTHONPATH="$HOME/Desktop"' >> ~/.profile

echo '# API KEY' >> ~/.profile
echo 'if [ -f ~/Desktop/.bash_mykey ] ; then' >> ~/.profile
echo '  . ~/Desktop/.bash_mykey' >> ~/.profile
echo 'fi' >> ~/.profile

echo '# GCP' >> ~/.profile
echo 'export GOOGLE_APPLICATION_CREDENTIALS="***"' >> ~/.profile

