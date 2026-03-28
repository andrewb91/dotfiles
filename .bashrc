#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias python="python3"
alias vim=nvim
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
PS1='[\u@\h \W]\$ '
export EDITOR='/usr/bin/vim'
export VISUAL='/usr/bin/vim'

export PATH=/home/drew/.local/bin:$PATH
export HISTCONTROL=ignoreboth

# Show a directory listing when using 'cd'
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && /bin/ls -lhF --time-style=long-iso --color=auto --ignore=lost+found
}

