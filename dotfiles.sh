#!/usr/bin/zsh
DIR=$(dirname $0)

usage(){
    echo "<command> backup :  backup all configs"
    echo "<command> restore : restore all configs"
}

backup_configs(){
    # bacup .gitconfig , .keras/keras.json .vimrc, .zshrc, .bashrc,
    # code settings.json

    \cp ~/.gitconfig $1/gitconfig
    \cp ~/.vim/vimrc $1/vimrc
    \cp ~/.zshrc $1/zshrc
    \cp ~/.bashrc $1/bashrc
    \cp ~/.tmux.conf $1/tmux.conf

    \mkdir -p $1/code
    \cp ~/.config/Code/User/settings.json $1/code/settings.json

    \cp ~/.keras/keras.json $1/keras.json
    \cp ~/.jupyter/jupyterhub_config.py $1/jupyterhub_config.py

}

restore_configs(){
    \cp $1/gitconfig ~/.gitconfig
    \mkdir -p ~/.vim && \cp $1/vimrc ~/.vim/
    \cp $1/zshrc ~/.zshrc
    \cp $1/bashrc ~/.bashrc
    \cp $1/tmux.conf ~/.tmux.conf

    \mkdir -p ~/.config/Code/User && \cp $1/code/settings.json ~/.config/Code/User/settings.json

    \mkdir -p ~/.keras && \cp $1/keras.json ~/.keras/keras.json
    \mkdir -p ~/.jupyter && \cp $1/jupyterhub_config.py ~/.jupyter/
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

if [[ $1 == "backup" ]]; then
    echo "backing up to $DIR/configs"
    rm -rf $DIR/configs && mkdir -p $DIR/configs && backup_configs $DIR/configs
elif [[ $1 == "restore" ]]; then
    echo "backing up to $DIR"
    rm -rf .backup && mkdir -p $DIR/.backup && backup_configs $DIR/.backup

    echo "restoring from $DIR/configs"
    restore_configs $DIR/configs
else
    usage
    exit 1
fi
