#!/bin/sh


### Install packages
echo 'Installing packages...'

### Install prerequisites and dependencies
sudo pacman -S alacritty tmux fish neovim fzf ripgrep ghq

### Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo 'Installed tpm!'


### Install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
echo 'Installed dein!'


### Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
echo 'Installed pyenv!'


### Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v-1.37.2/install.sh | bash


echo 'All done!'
