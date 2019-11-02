jupyter labextension install @mflevine/jupyterlab_html
jupyter labextension install @jupyterlab/plotly-extension
jupyter labextension install @jupyterlab/latex
jupyter labextension install @jupyterlab/git
jupyter labextension install @jupyterlab/toc
jupyter labextension install jupyterlab_vim
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install jupyterlab_tensorboard
jupyter labextension install dcos-jupyterlab-tensorboard-extension
jupyter labextension install jupyterlab-spreadsheet
jupyter labextension install @jupyterlab/google-drive
jupyter serverextension enable jupyterlab_sql --py --sys-prefix
jupyter lab build
