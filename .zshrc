# P10K instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
[[ ! -f ~/.zsh/aliases.sh ]] || source ~/.zsh/aliases.sh
[[ ! -f ~/.aliases ]] || source ~/.aliases

# Base16 shell
[[ ! -f ~/.zsh/base16.sh ]] || source ~/.zsh/base16.sh

# OMZ config
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
HISTORY_IGNORE="(exit|logout|poweroff|reboot|shutdown|suspend)*"
DISABLE_UNTRACKED_FILES_DIRTY="true"
zstyle ':omz:update' mode disabled

# Antigen
export ADOTDIR=~/.zsh/antigen

while [[ ! -d ~/.zsh ]]; do
  mkdir ~/.zsh
done

while [[ ! -f ~/.zsh/antigen.zsh ]]; do
  curl -L git.io/antigen > ~/.zsh/antigen.zsh
done

source ~/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle copybuffer
antigen bundle copyfile
antigen bundle copypath
antigen bundle fd
antigen bundle fzf
antigen bundle gitfast
antigen bundle ripgrep
antigen bundle sudo
antigen bundle z

antigen theme romkatv/powerlevel10k

antigen apply

# P10K config
while [[ ! -f ~/.zsh/p10k.zsh ]]; do
  cat "$ADOTDIR/bundles/romkatv/powerlevel10k/config/p10k-lean-8colors.zsh" |
    sed 's/nerdfont-complete/ascii/g' |
    sed 's/─/-/g' | sed 's/❯/>/g' | sed 's/❮/</g' | sed 's/▶/^/g' |
    sed 's/…/\.\./g' | sed 's/⇣/</g' | sed 's/⇡/>/g' | sed 's/⇠/<-/g' | 
    sed 's/⇢/->/g' | sed 's/✔/ok/g' | sed 's/✘/err/g' |
    sed "s/'%K{0}▁' '%K{0}▂' '%K{0}▃' '%K{0}▄' '%K{0}▅' '%K{0}▆' '%K{0}▇' '%K{0}█'/'battery'/g" > ~/.zsh/p10k.zsh
done

source ~/.zsh/p10k.zsh

typeset -g POWERLEVEL9K_DIR_CLASSES=()
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
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=16
function p10k-on-pre-prompt() {}
function p10k-on-post-prompt() {}
