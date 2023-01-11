#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definition
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prompt
PS1='[\u@\h \W]\$ '
