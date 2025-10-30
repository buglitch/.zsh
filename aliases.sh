#!/bin/sh
# colors
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
alias tree='tree -C -L 2'
alias vdir='vdir --color=auto'
alias vgrep='fgrep --color=auto'

# sudo with aliases
alias sudo='sudo '

# override
alias cp='cp -i'
alias emacs='emacs -nw'
alias fastfetch='fastfetch --config ~/.config/fastfetch.jsonc'
alias fd='fdfind'
alias gdb-multiarch='gdb-multiarch -q'
alias gdb='gdb -q'
alias i3lock='i3lock -c 000000'
alias mv='mv -i'
alias reset='tput reset'
alias rm='rm -i'
alias tty-clock='tty-clock -s -c -C 7'
alias unzip='bsdtar -xf'
alias yazi='y'

# optional overrides
ealias() {
  command -v "${2}" >/dev/null 2>&1 && alias "${1}"="${2}"
}
eealias() {
  command -v "${2}" >/dev/null 2>&1 && alias "${1}"="${2} ${*:3}"
}
ealias LS sl
#ealias cat bat --color=auto -p --theme=ansi --italic-text=always
eealias bat batcat --color=auto --style=header --italic-text=always --paging=never
ealias code codium
eealias df duf --hide-fs squashfs,tmpfs,devtmpfs
ealias diff batdiff
eealias ls eza --icons=auto
ealias man batman
ealias pacman paru
eealias ranger source ranger
ealias vi nvim
ealias vim nvim
ealias watch batwatch

eval "$(zoxide init --cmd cd zsh)"

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

# wrappers
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    \yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
