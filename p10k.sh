#!/bin/sh

# P10K instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Generate ~/.zsh/p10k.zsh 
generate_p10k_config() {
while [[ ! -f ~/.zsh/p10k.zsh ]]; do
cat "$ADOTDIR/bundles/romkatv/powerlevel10k/config/p10k-lean-8colors.zsh" |
sed 's/nerdfont-complete/ascii/g' |
sed 's/─/-/g' | sed 's/❯/>/g' | sed 's/❮/</g' | sed 's/▶/^/g' |
sed 's/…/\.\./g' | sed 's/⇣/</g' | sed 's/⇡/>/g' | sed 's/⇠/<-/g' | 
sed 's/⇢/->/g' | sed 's/✔/ok/g' | sed 's/✘/err/g' |
sed "s/'%K{0}▁' '%K{0}▂' '%K{0}▃' '%K{0}▄' '%K{0}▅' '%K{0}▆' '%K{0}▇' '%K{0}█'/'battery'/g" > ~/.zsh/p10k.zsh

echo "typeset -g POWERLEVEL9K_DIR_CLASSES=()
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=
typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION=
unset -f prompt_example
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=10
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=9
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='$'
typeset -g POWERLEVEL9K_DIR_FOREGROUND=6
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=6
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=6
typeset -g POWERLEVEL9K_STATUS_ERROR=true
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=208
function p10k-on-pre-prompt() {}
function p10k-on-post-prompt() {}" >> ~/.zsh/p10k.zsh
done
}
