#
# ~/.config/zsh/.zprofile
#

#[[ -f ~/.config/zsh/.zprofile ]] && . ~/.config/zsh/.zprofile
#

if [ -z "${DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startx
fi

