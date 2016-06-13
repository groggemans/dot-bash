##############################################################################
# @file bashrc
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

SHELL_LIB="$HOME/.config/shell/lib"

if [ ! -d "$HOME/.config/shell" ]; then
    echo "Could not find commen files"
    return
fi

# Helper functions
source "$SHELL_LIB/helpers.sh"

# Exports
source "$SHELL_LIB/exports.sh"

# Tmux stuff
source "$SHELL_LIB/tmux.sh"

# Some useful checks
source "$SHELL_LIB/checks.sh"

# Colors
source "$SHELL_LIB/color.sh"

# Bash settings
source ~/.config/bash/setopt.bash

# Prompt
source "$SHELL_LIB/prompt.sh"

# Aliases
source "$SHELL_LIB/aliases.sh"

# Useful functions
source "$SHELL_LIB/functions.sh"

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

if [ -f ~/.secret/bash/bashrc ]; then
    source ~/.secret/bash/bashrc
fi

##############################################################################
# Other config

if [ -d ~/.config/shell/source ]; then
    shopt -s dotglob nullglob
    for file in ~/.config/shell/source/*; do
        source "$file"
    done
    shopt -u dotglob nullglob
fi

##############################################################################
# Local config

if [ -f ~/.local/bash/bashrc ]; then
    source ~/.local/bash/bashrc
fi

##############################################################################
