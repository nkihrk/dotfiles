#!/bin/sh

### prerequisites for dotfiles

# tmux - https://github.com/tmux/tmux
# fish - https://github.com/fish-shell/fish-shell
# neovim - https://github.com/neovim/neovim


### dependencies

# tpm - https://github.com/tmux-plugins/tpm
# dein - https://github.com/Shougo/dein.vim
# pyenv - https://github.com/pyenv/pyenv
# pyenv-virtualenv - https://github.com/pyenv/pyenv-virtualenv
# nvm - https://github.com/nvm-sh/nvm
# fisher - https://github.com/jorgebucaran/fisher
# nvm.fish - https://github.com/jorgebucaran/nvm.fish

# BROWSER - google-chrome
# EDITOR - neovim
# VISUAL - neovim
# MAIL - thunderbird


### system

# load fcitx-mozc configs
ln -sf ~/dotfiles/.xprofile ~/.xprofile


### tmux

ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf


### fish

# load envs
ln -sf ~/dotfiles/.profile ~/.profile

# fish configs
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/fish/fish_variables ~/.config/fish/fish_variables


### neovim

# create a directory for neovim configs
mkdir ~/.config/nvim
ln -sf ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/neovim/init.vim ~/.vimrc

# create a directory for dein tomls
mkdir ~/.cache/dein/rc
ln -sf ~/dotfiles/neovim/rc/dein.toml ~/.cache/dein/rc/dein.toml
ln -sf ~/dotfiles/neovim/rc/dein_lazy.toml ~/.cache/dein/rc/dein_lazy.toml
