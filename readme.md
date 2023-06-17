To install:

    git clone https://github.com/m-col/vim-misc ~/.vim/pack/vim-misc
    mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
    echo "source ~/.vim/pack/vim-misc/tmux.conf" > ~/.tmux.conf
    mkdir -p $HOME/.vim/{backups,sessions,swap,undo,spell}

To update git submodule plugins:

    git -C ~/.vim/pack/vim-misc submodule update --remote
