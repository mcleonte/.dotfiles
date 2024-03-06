#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls -1sh --color=auto'
alias chrome='google-chrome-stable'
alias v='nvim'
alias envim='source ~/cs/.envs/py/nvim/bin/activate'
alias activate="source .venv/bin/activate"
alias cdz="cd ~/cs/prj/zaida && source .venv/bin/activate"
alias dots='/usr/bin/git --git-dir=/home/leo/.dotfiles/ --work-tree=/home/leo'
alias du='du -sh'
alias hibernate='systemctl hibernate'
alias dc='docker-compose'
alias s0='shutdown 0'
alias bmng='blueman-manager'
alias pctrl='pavucontrol'

source ~/.set-secrets.sh

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# Created by `pipx` on 2022-06-10 18:51:22
export PATH="$PATH:/home/leo/.local/bin"
alias td="~/cs/prj/todo-cmd/todo.py"
