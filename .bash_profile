#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Created by `pipx` on 2022-06-10 18:51:22
export PATH="$PATH:/home/leo/.local/bin"

# Autostart X at login
# https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
