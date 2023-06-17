To install:

    git clone https://github.com/m-col/vim-misc ~/.vim/pack/vim-misc
    mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
    echo "source $dir/tmux.conf" > ~/.tmux.conf

To update git submodule plugins:

    git -C ~/.vim/pack/vim-misc submodule update --remote
