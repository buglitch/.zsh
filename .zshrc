# P10K instant prompt
[ -f ~/.zsh/.profile ] && source ~/.zsh/.profile

if [[ ! -z "${ZSHRC_P10K_PROMPT}" ]]; then
  [[ ! -f ~/.zsh/p10k.sh ]] || source ~/.zsh/p10k.sh
fi

# ZSH config
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
HISTFILE=~/.zsh/.zsh_history
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
antigen bundle dirhistory
antigen bundle gitfast
antigen bundle sudo
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

for package in "${ZSHRC_ANTIGEN_EXTRA_PACKAGES[@]}"; do
  antigen bundle "${package}"
done

[[ -z "${ZSHRC_P10K_PROMPT}" ]] || antigen theme romkatv/powerlevel10k
[[ -z "${ZSHRC_CUSTOM_PROMPT}" ]] || antigen theme ${ZSHRC_CUSTOM_PROMPT}

antigen apply

# Color scheme
[[ ! -f ~/.zsh/colors.sh ]] || source ~/.zsh/colors.sh

# Aliases
[[ ! -f ~/.zsh/aliases.sh ]] || source ~/.zsh/aliases.sh
[[ ! -f ~/.aliases ]] || source ~/.aliases

# prompt config
if [[ ! -z "${ZSHRC_P10K_PROMPT}" ]]; then
  while [[ ! -f ~/.zsh/p10k.zsh ]]; do
    generate_p10k_config
  done
  source ~/.zsh/p10k.zsh
fi

if [[ -z "${ZSHRC_CUSTOM_PROMPT}" ]] && [[ -z "${ZSHRC_P10K_PROMPT}" ]]; then
  source ~/.zsh/prompt.zsh
fi
