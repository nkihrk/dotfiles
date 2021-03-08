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
# plugin peco for fish - https://github.com/oh-my-fish/plugin-peco ( fisher install oh-my-fish/plugin-peco )
# z - https://github.com/jethrokuan/z
# fzf - https://github.com/jethrokuan/fzf ( we need to install fzf first )


## For NVM
# nvm - https://github.com/nvm-sh/nvm
# nvm.fish - https://github.com/jorgebucaran/nvm.fish

## For ALE
# prettier - https://prettier.io/docs/en/vim.html#vim-prettier-installation
# eslint - https://github.com/eslint/eslint

## A .profile config
# BROWSER - google-chrome
# EDITOR - neovim
# VISUAL - neovim
# MAIL - thunderbird


### System

# load fcitx-mozc configs
ln -sf ~/dotfiles/.xprofile ~/.xprofile


## Alacritty
ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml


### Tmux

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf


### Fish

# load envs
ln -sf ~/dotfiles/.profile ~/.profile

# Fish configs
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/fish/fish_variables ~/.config/fish/fish_variables


### NeoVim

# Create a directory for neovim configs
mkdir ~/.config/nvim
ln -sf ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/neovim/init.vim ~/.vimrc

# Create a directory for dein tomls
mkdir ~/.cache/dein/rc
ln -sf ~/dotfiles/neovim/rc/dein.toml ~/.cache/dein/rc/dein.toml
ln -sf ~/dotfiles/neovim/rc/dein_lazy.toml ~/.cache/dein/rc/dein_lazy.toml
