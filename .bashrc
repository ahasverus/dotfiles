#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases definition
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias battery='echo "battery = "$(cat /sys/class/power_supply/BAT0/capacity)"%"'
alias status='echo -e $(wifi)"\n"$(bluetooth)"\n"$(battery)'

# Prompt
PS1='[\u@\h \W]\$ '
