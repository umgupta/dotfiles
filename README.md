# dotfiles

## Useful commands

### Installing oh-my-zsh

- `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
- Autosuggestions `git clone <https://github.com/zsh-users/zsh-autosuggestions> ~/.oh-my-zsh//plugins/zsh-autosuggestions`

--------------------------------------------------------------------------------

Run `./dotfiles restore`

--------------------------------------------------------------------------------

### Installing node and proxy tools for jupyter

- `NVM_DIR="" && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash`

- `source ~/.zshrc && nvm install 8.11.2`

- `npm i -g configurable-http-proxy`

### Installing mini-conda

- `wget -c https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh`
- `conda create -n <ENV_NAME> python`
- python packages

  - GPU: `conda install pytorch matplotlib scikit-learn scipy numpy tensorflow-gpu jupyterlab`
  - CPU: `conda install pytorch matplotlib scikit-learn scipy numpy tensorflow jupyterlab`
  - `pip install jupyterhub`
