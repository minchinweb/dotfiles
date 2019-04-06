#
# ~/.bashrc
#

# if we're on a non-interactive session, bail here!
[[ $- != *i* ]] && return

#
# Function to display color table
Get-Colours() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}


#
# Personal Additions

#
## Path Additions Functions
# https://superuser.com/a/753948/447564
pathappend() {
  for ARG in "$@"
  do
      ARG="${ARG/#\~/$HOME}"  # expand ~ into Home
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

pathprepend() {
      for ((i=$#; i>0; i--)); 
      do
        ARG=${!i}
        ARG="${ARG/#\~/$HOME}"  # expand ~ into Home
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="$ARG${PATH:+":$PATH"}"
        fi
      done
}

# Reload this configuration file
alias refresh-env='source ~/.bashrc && echo "Reloaded Bash Configuration"'
# sort environmental variables
alias env='env | sort'
# automatically create parent directories as needed
alias mkdir='mkdir -pv'
# run wget in 'continue' mode (auto pick up broken/half-finished downloads)
alias wget='wget -c'
# only run 4 pings (like Windows, rather than forever)
alias ping='ping -c 4'
# when removing files, do so interactively
alias rm='rm -i'

# set editor to vi (default was nano on Arch/Majaro)
if [ -f /usr/bin/vi ]; then
    export EDITOR=/usr/bin/vi
fi

# Add Rust's user-compiled pakcages bin folder to PATH
pathprepend '~/.cargo/bin/'
# Add Python's user-installed packages bin folder to PATH
pathprepend '~/.local/bin/'
pathprepend '~/bin/'

# Use the system config if it exists
if [ -f /etc/bashrc ]; then
    . /etc/bashrc        # --> Read /etc/bashrc, if present.
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc   # --> Read /etc/bash.bashrc, if present.
fi

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

if [ -f ~/.local.bashrc ]; then
    source ~/.local.bashrc
fi

# Use Bash completion, if installed
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

## Use Sensible Bash
# https://github.com/mrzool/bash-sensible
# load before Liquid Prompt
if [ -f ~/Code/bash-sensible/sensible.bash ]; then
    source ~/Code/bash-sensible/sensible.bash
elif [ -f ~/.homesick/repos/bash-sensible/sensible.bash ]; then
    source ~/.homesick/repos/bash-sensible/sensible.bash
fi

# Use Liquid Prompt -- https://github.com/nojhan/liquidprompt
if [ -f ~/Code/liquidprompt/liquidprompt ]; then
    source ~/Code/liquidprompt/liquidprompt
elif [ -f ~/.homesick/repos/liquidprompt/liquidprompt ]; then
    source ~/.homesick/repos/liquidprompt/liquidprompt
fi

# Make Homeshick available
if [ -f ~/.homesick/repos/homeshick/homeshick.sh ]; then
    source ~/.homesick/repos/homeshick/homeshick.sh
    source ~/.homesick/repos/homeshick/completions/homeshick-completion.bash
fi

## So as not to be disturbed by Ctrl-S or Ctrl-Q in terminals
# https://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
stty -ixon

# Hit `Esc` twice to clear the line
# note there is a small delay on this
# https://unix.stackexchange.com/questions/30987/windows-shell-escape-key-delete-whole-line-equivalent-in-bash
bind '"\e\e":kill-whole-line'

## Run neofetch as our MOTD on login
# neofetch
