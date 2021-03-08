# Set vim as default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Zsh theme
ZSH_THEME="spaceship"

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
# setopt prompt_subst

# Prompt a current branch name
# RPROMPT='`rprompt-git-current-branch`'

# Plugins
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[[ -f ~/.zsh-scripts ]] && . ~/.zsh-scripts
[[ -f ~/.profile ]] && . ~/.profile

