#!/bin/sh


### Initialize
echo 'Initializing...'

rm -rf ~/.config/fish/completions/* 2> /dev/null
rm -rf ~/.config/fish/conf.d/* 2> /dev/null
rm -rf ~/.config/fish/functions/* 2> /dev/null
rm -rf ~/.config/nvim 2> /dev/null
rm -rf ~/.cache/dein/rc 2> /dev/null


### Install configs
echo 'Loading configs...'

# Load fcitx-mozc configs
ln -sf ~/.dotfiles/.xprofile ~/.xprofile


# Git config
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig


## Alacritty
ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml


### Tmux

ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf


### Fish

# Load envs
ln -sf ~/.dotfiles/.profile ~/.profile

# Fish configs
ln -sf ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish


### NeoVim

# Create a directory for neovim configs
mkdir ~/.config/nvim
ln -sf ~/.dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.dotfiles/neovim/init.vim ~/.vimrc

# Create a directory for dein tomls
mkdir ~/.cache/dein/rc
ln -sf ~/.dotfiles/neovim/rc/dein.toml ~/.cache/dein/rc/dein.toml
ln -sf ~/.dotfiles/neovim/rc/dein_lazy.toml ~/.cache/dein/rc/dein_lazy.toml

echo 'All done!'
