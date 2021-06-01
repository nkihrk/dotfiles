## Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
## Source .profile to apply its values
bass source ~/.profile


## Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end


## Starship prompt
switch (uname)
    case Linux
      source ("/usr/bin/starship" init fish --print-full-init | psub)
    case Darwin
      source ("/usr/local/bin/starship" init fish --print-full-init | psub)
    case '*'
end


## Set NVM_DIR
switch (uname)
    case Linux
      function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
      end
    case Darwin
      function nvm
         bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
      end
    case '*'
end
set -x NVM_DIR ~/.nvm
nvm use default --silent


## Set yarn bin path
if not contains -- $HOME/.yarn/bin $fish_user_paths
    set -Ux fish_user_paths $HOME/.yarn/bin $fish_user_paths
end


# Set PATH for goenv
set -x GOENV_ROOT $HOME/.goenv
if not contains -- $GOENV_ROOT/bin $fish_user_paths
  set -Ux fish_user_paths $GOENV_ROOT/bin $fish_user_paths
end
eval (goenv init - | source)
if not contains -- $GOENV_ROOT/bin $fish_user_paths
  set -Ux fish_user_paths $GOPATH/bin $fish_user_paths
end
# Set go's bin path
if not contains -- $GOPATH/bin $fish_user_paths
  set -Ux fish_user_paths $GOPATH/bin $fish_user_paths
end



## Add $HOME/.pyenv to PYENV_ROOT
set -Ux PYENV_ROOT $HOME/.pyenv
## add $PYENV_ROOT/bin to fish_user_paths
if not contains -- $PYENV_ROOT/bin $fish_user_paths
    set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
end
## Init pyenv
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source


## To prevent fzf from comflicting with other functions' keybinds
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
set -U FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!{.git,node_modules}/*'"
set -U FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND


## ghq + fzf
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end


## nvim + ripgrep
function vrg
  set EX_CMD (
        set FL 0
        while read -d : -l fn ln line
            if test $FL = "0"
                printf "e %s" "$fn"
                set FL 1
            else
                printf "|tabnew %s" "$fn"
            end
            printf "|silent :%d" "$ln"
        end < (rg -n "$argv[1]" | peco --select-1 | psub)
    )
    if test -n "$EX_CMD"
      nvim -c "$EX_CMD"
    end
end


## select history with peco
function peco_select_history
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end

  history|peco $peco_flags|awk '{c="";for(i=3;i<=NF;i++) c=c $i" "; print c}'|awk '{sub(/[ \t]+$/, "")}1'|read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end


## Find a process and kill it
function pk
  for pid in (ps aux | peco | awk '{ print $2 }');
    kill $pid & echo "Killed $pid";
  end
end


## rewrite emails of the git logs
function rewrite_email_git
  git filter-branch --force --env-filter "GIT_AUTHOR_EMAIL='40584391+nkihrk@users.noreply.github.com'; GIT_COMMITTER_EMAIL='40584391+nkihrk@users.noreply.github.com';" --tag-name-filter cat -- --all
end


## rewrite names of the git logs
function rewrite_name_git
  git filter-branch --force --env-filter "GIT_AUTHOR_NAME='nkihrk'; GIT_COMMITTER_NAME='nkihrk';" --tag-name-filter cat -- --all
end


## unzipped zips with valid Japanese characters via unzip-conv
function unzipjp
  unzip -O CP932 $argv -d (dirname $argv)
end

function unzipjp-all
  for zip in *.zip
    unzipjp (echo $zip)
  end
end


## fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
  bind \cr 'peco_select_history (commandline -b)'
end


## Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


## Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end


## Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
  set from (echo $argv[1] | trim-right /)
  set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first' # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | egrep '^\.'"

# Replace some more things with better alternatives
[ ! -x /usr/bin/bat ] && [ -x /usr/bin/cat ] && alias cat='bat'

# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions && sudo updatedb'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get fastest mirrors 
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist" 
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist" 
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist" 
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist" 

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias paru="paru --bottomup"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Replace yay with paru
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'


## Run paleofetch if session is interactive
switch (uname)
    case Linux
      if status --is-interactive
        paleofetch
        end
    case '*'
end


