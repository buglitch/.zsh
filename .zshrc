# P10K instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
[[ ! -f ~/.zsh/aliases.sh ]] || source ~/.zsh/aliases.sh
[[ ! -f ~/.aliases ]] || source ~/.aliases

# Base16 shell
[[ ! -f ~/.zsh/base16.sh ]] || source ~/.zsh/base16.sh

# ZSH config
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
HISTORY_IGNORE="(exit|logout|poweroff|reboot|shutdown|suspend)*"

# OMZ config
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

# P10K prompt config
[[ ! -f ~/.zsh/p10k.sh ]] || source ~/.zsh/p10k.sh
