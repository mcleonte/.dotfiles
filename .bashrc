# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/leo/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/leo/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/leo/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/leo/Downloads/google-cloud-sdk/completion.bash.inc'; fi



PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias chrome='google-chrome-stable'
alias bnet='bash ~/shortcuts/bnet.sh'
alias vim='nvim'
alias v='vim'
alias base='source ~/dev/.envs/base/bin/activate'
alias trader='source ~/dev/.envs/trader/bin/activate'
alias zaider='python -m zaider'
alias bnet='lutris lutris:rungame/world-of-warcraft &'
alias yt='chrome youtube.com'
alias ytm='chrome music.youtube.com'
alias dots='/usr/bin/git --git-dir=/home/leo/.dotfiles/ --work-tree=/home/leo'
alias du='du -sh'
alias hibernate='systemctl hibernate'
alias pgadmin='source ~/dev/.envs/pgadmin/bin/activate'
alias dc='docker-compose'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
