#!/bin/sh
# colors
alias bat='PAGER=cat bat --color=auto --theme=ansi --italic-text=always'
alias diff='diff --color=auto'
alias dir='dir --color=auto'
alias dmesg='dmesg --color=auto'
alias egrep='egrep --color=auto'
alias fd='fd --color=auto'
alias fgrep='fgrep --color=auto'
alias fzf='fzf --color=16'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias minicom='minicom --color=on'
alias ncdu='ncdu --color=dark'
alias rg='rg --color=auto'
alias tree='tree -C'
alias vdir='vdir --color=auto'
alias vgrep='fgrep --color=auto'

# sudo with aliases
alias sudo='sudo '

# override
alias cp='cp -i'
alias emacs='emacs -nw'
alias gdb-multiarch='gdb-multiarch -q'
alias gdb='gdb -q'
alias i3lock='i3lock -c 000000'
alias mv='mv -i'
alias ranger='source ranger'
alias reset='tput reset'
alias rm='rm -i'
alias vi="nvim"
alias vim="nvim"

# vim terminal
if [ ! -z ${VIMRUNTIME} ]; then
    vim_alias() {
        n="$1"
        v="$2"
        for (( i=$3; i<=${#n}; i++ )); do alias ":${n:0:$i}"=" $v"; done
    }

    vim_alias 'edit' 'nvr --remote' 1
    vim_alias 'quit' 'exit' 1
    vim_alias 'split' 'nvr -o' 2
    vim_alias 'tabedit' 'nvr -p' 4
    vim_alias 'vsplit' 'nvr -O' 2

    unset -f vim_alias
fi
