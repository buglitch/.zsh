#!/bin/sh

# Base16-256 Tango
if [ -n "$TMUX" ]; then
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
fi

put_template 16  "F5/79/00"
put_template 17  "8F/59/02"
put_template 18  "2E/34/36"
put_template 19  "88/8A/85"
put_template 20  "BA/BD/B6"
put_template 21  "FF/FF/FF"

# Fixing xterm-256 color approximation
put_template 208 "F5/79/00"
put_template 94  "8F/59/02"
put_template 236 "2E/34/36"
put_template 245 "88/8A/85"
put_template 250 "BA/BD/B6"
put_template 231 "FF/FF/FF"


unset put_template
