# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##
## ZSH configuration
##

# Path to oh-my-zsh installation.
export ZSH=$HOME/.config/oh-my-zsh

# History
HISTFILE=$HOME/.cache/zsh/history

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto-update behavior
zstyle ':omz:update' mode auto      # update automatically without asking

# Auto-update frequency (in days)
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# HIST_STAMPS="yyyy/mm/dd"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search z)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


## ALIASES

alias ..='cd ..'
alias ls='ls --color=auto'
alias ll='ls --color=auto -al'

alias code='codium'
alias zrc='codium $HOME/.config/zsh/.zshrc'

alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ds='dot status'
alias da='dot add'
alias dc='dot commit -m'
alias dp='dot push'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline --graph'

alias battery='echo "battery = "$(cat /sys/class/power_supply/BAT0/capacity)"%"'
alias status='echo -e $(wifi)"\n"$(bluetooth)"\n"$(battery)'

alias meteo='curl -s http://wttr.in/montpellier'

alias notes='codium $HOME/nextcloud/Notes/notes.code-workspace'
alias gists='codium $HOME/github/gists/gists.code-workspace'

alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias suspend='systemctl suspend-then-hibernate'
alias logout='bspc quit'
alias lock='i3lock -i $HOME/.config/wallpapers/screenlock-arch.png -c "#2f343f"'

alias vpn='sudo openfortivpn'

## HOTKEYS

bindkey '[C' forward-word
bindkey '[D' backward-word

## Others

export LESSHISTFILE=-
export BROWSER=firefox

source $HOME/.local/bin/bluetooth-utils.sh


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
