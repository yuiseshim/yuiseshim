jupyter labextension install @mflevine/jupyterlab_html
jupyter labextension install @jupyterlab/plotly-extension
jupyter labextension install @jupyterlab/latex
jupyter labextension install @jupyterlab/git
pip install jupyterlab-git
jupyter serverextension enable --py jupyterlab_git
jupyter labextension install @jupyterlab/toc
jupyter labextension install @lckr/jupyterlab_variableinspector
jupyter labextension install dcos-jupyterlab-tensorboard-extension
jupyter labextension install jupyterlab-spreadsheet
jupyter labextension install @jupyterlab/google-drive
jupyter serverextension enable jupyterlab_sql --py --sys-prefix
jupyter labextension install @lckr/jupyterlab_variableinspector
pip install ipywidgets
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter nbextension enable --py --sys-prefix widgetsnbextension
#jupyter labextension install jupyterlab_tensorboard
#jupyter serverextension enable --py jupyterlab_tensorboard
#jupyter labextension install jupyterlab_vim
jupyter lab build
