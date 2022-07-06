# options section
setopt appendhistory
setopt autocd
setopt histignorealldups
setopt interactivecomments
setopt nobeep
setopt noclobber
setopt nolisttypes
setopt nonomatch
setopt numericglobsort

# completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select=2
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/z
zmodload zsh/complist
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# history
HISTFILE=~/.zhistory
HISTORY_IGNORE="(exit|logout|poweroff|reboot|shutdown|suspend)*"
HISTSIZE=1000
SAVEHIST=500

# prompt
export PROMPT='%n:%1~\$ '
autoload -Uz add-zsh-hook
zsh_prompt_dash_var=0
zsh_prompt_dash_line() {
   zsh_prompt_ret=$?
   zsh_prompt_var=$history[$((HISTCMD - 1))]
   if [ $zsh_prompt_dash_var -eq 1 ] && [ "$zsh_prompt_var" != "clear" ]; then
       if [ $zsh_prompt_ret -eq 0 ]; then
           echo -e "\e[34m$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)\e[39m"
       else
           echo -e "\e[35m$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)\e[39m"
       fi
   else
       zsh_prompt_dash_var=1
   fi
}
add-zsh-hook -Uz precmd zsh_prompt_dash_line
if [[ $UID == 0 || $EUID == 0 ]]; then
    export PROMPT=$'%n:%1~%(?..%{\e[31m%}[%?]%{\e[39m%})%{\e[95m%}%#%{\e[39m%} '
else
    export PROMPT=$'%n:%1~%(?..%{\e[31m%}[%?]%{\e[39m%})%{\e[94m%}\$%{\e[39m%} '
fi

# title
case $TERM in
  xterm*|*rxvt*)
    precmd () {print -Pn "\e]0;%n@%M:%~\a"}
    ;;
esac

# tweaks
stty -ixon
stty erase "^?"

# bindkey
bindkey -v

bindkey -M menuselect '\t' menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

bindkey "^L"      clear-screen

bindkey "^[OA"    up-line-or-history
bindkey "^[[A"    up-line-or-history

bindkey "^[OB"    down-line-or-history
bindkey "^[[B"    down-line-or-history

bindkey "^[OC"    vi-forward-char
bindkey "^[[C"    vi-forward-char
bindkey "^[OD"    vi-backward-char
bindkey "^[[D"    vi-backward-char

bindkey "^[[H"    beginning-of-line
bindkey "^[[1~"   beginning-of-line
bindkey "^[[7~"   beginning-of-line
bindkey "^A"      beginning-of-line
bindkey "^Q"      beginning-of-line

bindkey "^[[F"    end-of-line
bindkey "^[[4~"   end-of-line
bindkey "^[[8~"   end-of-line
bindkey "^E"      end-of-line
bindkey "^D"      end-of-line

bindkey "^[[3~"   delete-char
bindkey "^[3;5~"  delete-char
bindkey "\e[3~"   delete-char

bindkey '^?'      backward-delete-char
bindkey "^H"      backward-kill-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# color scheme
[[ ! -f ~/.zsh/colors.sh ]] || source ~/.zsh/colors.sh

# aliases
[[ ! -f ~/.zsh/aliases.sh ]] || source ~/.zsh/aliases.sh
[[ ! -f ~/.aliases ]] || source ~/.aliases
setopt COMPLETE_ALIASES
