#!/bin/sh
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

if [ -n "$TMUX" ]; then
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
fi

# Fixing xterm-256 color approximation for Tango vim scheme
put_template 208 "F5/79/00"
put_template 238 "2E/34/36"
put_template 244 "88/8A/85"
put_template 250 "BA/BD/B6"
put_template 231 "FF/FF/FF"

unset put_template
