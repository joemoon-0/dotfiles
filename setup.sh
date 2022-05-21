#!/bin/bash

echo -e " --- INITIATING DOTFILE CONFIGURATION SETUP ---\n"

# -- neovim symlink --
echo "> NEOVIM"
if [ ! -d ~/.config/nvim ]
then
    mkdir ~/.config/nvim
    echo "~/.config/nvim created."
fi

if [ ! -L ~/.config/nvim/init.vim ]
then
    cd ~/.config/nvim
    ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim
    echo "init.vim symlink created."
else
    echo "init.vim symlink already exists."
fi

# -- zshrc symlink --
echo -e "\n> ZSH"
if [ ! -L ~/.zshrc ]
then
    ln -s ~/.dotfiles/.zshrc ~/.zshrc
else
    echo ".zshrc symlink already exists."
fi

# -- tmux symlink --
echo -e "\n> TMUX"
if [ ! -L ~/.tmux.conf ]
then
    ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
else
    echo ".tmux.conf symlink already exists."
fi
