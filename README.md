# <p align="middle">.dotfiles</p>

## Notice

.dotfiles hosted in this repository might be heavily relay on my Garuda Linux environment.<br>
To know deeply about the Garuda Linux, please check [their official website](https://garudalinux.org/).
<br>

Heads Up:
You need to rewrite a user section(email and name) in .gitconfig.

## Installation

### Install prerequisites and dependencies

```shell
sudo pacman -S alacritty tmux fish neovim fzf ripgrep ghq
```

### Load config files

This shell script will automatically create symlinks for config files and apply to appropriate directories.

```shell
sh ./load.sh
```

### Install packages

Install tpm to manage tmux plugins

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install dein for neovim

```shell
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

Install pyenv and pyenv-virtualenv

```shell
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
```

Install nvm

```shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v-1.37.2/install.sh | bash
```

Install goenv

```shell
git clone https://github.com/syndbg/goenv.git $HOME/.goenv
```

Install fisher

```shell
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
```

### Fish plugins

bass ([https://github.com/edc/bass](https://github.com/edc/bass))

```shell
fisher install edc/bass
```

z ([https://github.com/jethrokuan/z](https://github.com/jethrokuan/z))

```shell
fisher install jethrokuan/z
```

fzf ([https://github.com/jethrokuan/fzf](https://github.com/jethrokuan/fzf))

```shell
fisher install jethrokuan/fzf
```

fish-bd ([https://github.com/0rax/fish-bd](https://github.com/0rax/fish-bd))

```shell
fisher install 0rax/fish-bd
```

fish-ghq ([https://github.com/decors/fish-ghq](https://github.com/decors/fish-ghq))

```shell
fisher install decors/fish-ghq
```

### Go packages

goimports

```shell
go get golang.org/x/tools/cmd/goimports
```

### npm packages

neovim

```shell
npm -g i neovim
```

typescript

```shell
npm -g i typescript
```

### yarn packages

eslint

```shell
yarn global add eslint
```

prettier

```shell
yarn global add prettier
```

next

```shell
yarn global add next
```

### Additional packages

starship ([https://github.com/starship/starship](https://github.com/starship/starship))

```shell
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

# License

MIT Licence

Copyright (c) 2021 NkiHrk

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
