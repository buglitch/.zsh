function pathadd {
    PATH=:$PATH
    export PATH=$1${PATH//:$1:/:}
}

pathadd "$HOME/.local/bin"

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=zen-twilight
export PAGER="bat -p"
export MANPAGER="bat -l man -p"
export TERMINAL=foot
export SHELL=/bin/zsh

export GIT_EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export COLORTERM=truecolor
export TERM=foot-extra
export BAT_THEME="ansi"
export FZF_DEFAULT_COMMAND='fd --type f'

LESSOPEN="| batpipe %s";
export LESSOPEN;
unset LESSCLOSE;
LESS="$LESS -R";
BATPIPE="color";
export LESS;
export BATPIPE;
