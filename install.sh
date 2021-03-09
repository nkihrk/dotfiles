#!/bin/sh

### Prerequisites for dotfiles

# Alacritty - https://github.com/alacritty/alacritty
# Tmux - https://github.com/tmux/tmux
# Fish - https://github.com/fish-shell/fish-shell
# NeoVim - https://github.com/neovim/neovim


### Dependencies

## For Tmux
## Use <prefix> I to install plugins via the Tmux Plugin Manager
# tpm - https://github.com/tmux-plugins/tpm

## For NeoVim
# dein - https://github.com/Shougo/dein.vim
# pyenv - https://github.com/pyenv/pyenv
# pyenv-virtualenv - https://github.com/pyenv/pyenv-virtualenv

## Fish plugins
# fisher - https://github.com/jorgebucaran/fisher
# z - https://github.com/jethrokuan/z
# fzf - https://github.com/jethrokuan/fzf ( we need to install fzf and ripgrep first )
# fish-bd - https://github.com/0rax/fish-bd
# fish-ghq - https://github.com/decors/fish-ghq ( we need to install ghq first )

## For NVM
# nvm - https://github.com/nvm-sh/nvm
# nvm.fish - https://github.com/jorgebucaran/nvm.fish

## For ALE
## Install plugins below as global.
## This will allow ALE to use plugins on any files
# prettier - https://prettier.io/docs/en/vim.html#vim-prettier-installation
# eslint - https://github.com/eslint/eslint

## .profile
# BROWSER - google-chrome
# EDITOR - neovim
# VISUAL - neovim
# MAIL - thunderbird


### Notify start
echo 'Installing...'


### Initialize
#sh ./init.sh


### Load
sh ./load.sh


### Install plugins
#sh ./install-fish-plugins.sh


### Notify finish
echo 'Installed successfully!'
