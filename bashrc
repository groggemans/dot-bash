##############################################################################
# @file bashrc
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

if [ ! -d "$HOME/.config/shell" ]; then
    echo "Could not find commen files"
    exit
fi

# Helper functions
source ~/.config/shell/helpers.sh

# Exports
source ~/.config/shell/exports.sh

# Tmux stuff
source ~/.config/shell/tmux.sh

# Some useful checks
source ~/.config/shell/checks.sh

# Colors
source ~/.config/shell/color.sh

# Bash settings
source ~/.config/bash/setopt.bash

# Prompt
source ~/.config/shell/prompt.sh

# Aliases
source ~/.config/shell/aliases.sh

# Useful functions
source ~/.config/shell/functions.sh

##############################################################################

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##############################################################################
# Secret config

if [ -f ~/.secret/zsh/zshrc ]; then
    source ~/.secret/zsh/zshrc
fi

##############################################################################
# Other config

if [ -d ~/.config/shell/source ]; then
    for file in ~/.config/shell/source/*; do
        source "$file"
    done
fi

##############################################################################
# Local config

if [ -f ~/.local/zsh/zshrc ]; then
    source ~/.local/zsh/zshrc
fi

##############################################################################
