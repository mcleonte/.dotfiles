#!/bin/bash

alias ls='ls -1sh --color=auto'
alias chrome='google-chrome-stable'
alias activate="source .venv/bin/activate"
alias dots='/usr/bin/git --git-dir=/home/leo/.dotfiles/ --work-tree=/home/leo'
alias du='du -sh'
alias hibernate='systemctl hibernate'
alias dc='docker-compose'
alias s0='shutdown 0'
alias bmng='blueman-manager'
alias pctrl='pavucontrol'
alias td="~/cs/prj/todo-cmd/todo.py"
alias v="NVIM_APPNAME=lazyvim nvim"
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/lazyvim/'

