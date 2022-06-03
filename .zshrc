# P10K instant prompt
[[ -z "${ZSHRC_P10K_PROMPT}" ]] || [[ ! -f ~/.zsh/p10k.sh ]] || source ~/.zsh/p10k.sh

# Base16 shell
[[ ! -f ~/.zsh/base16.sh ]] || source ~/.zsh/base16.sh

# Aliases
[[ ! -f ~/.zsh/aliases.sh ]] || source ~/.zsh/aliases.sh
[[ ! -f ~/.aliases ]] || source ~/.aliases

# ZSH config
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
HISTORY_IGNORE="(exit|halt|logout|poweroff|reboot|shutdown|suspend)*"

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

[[ -z "${ZSHRC_P10K_PROMPT}" ]] || antigen theme romkatv/powerlevel10k

antigen apply

# prompt config
if [[ ! -z "${ZSHRC_P10K_PROMPT}" ]]; then
  while [[ ! -f ~/.zsh/p10k.zsh ]]; do
    generate_p10k_config
  done
  source ~/.zsh/p10k.zsh
else
  source ~/.zsh/prompt.zsh
fi
