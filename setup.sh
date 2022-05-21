#!/bin/bash

# -- neovim symlink --
if [ ! -d ~/.config/nvim ]
then
    mkdir ~/.config/nvim
fi

if [ ! -L ~/.config/nvim/init.vim ]
then
    cd ~/.config/nvim
    ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
fi

# -- zshrc symlink --
ln -s ~/.dotfiles/.zshrc ~/.zshrc
