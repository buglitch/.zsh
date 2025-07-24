# prompt
export PROMPT='%n@%m:%1~\$ '
autoload -Uz add-zsh-hook
dash_var=0

function timer() {
  timer=${timer:-$SECONDS}
}

dash_line() {
    local ret=${?}
    local var=$history[$((HISTCMD - 1))]

    if [[ ($dash_var -eq 2) || ($dash_var -eq 1 && "$var" != "clear" && "$var" != "reset") ]]; then
        if [ $timer ]; then
            local timer_show=$(($SECONDS - $timer))
        fi

        local git_branch="$(git_current_branch)"
        if [ $ret -eq 0 ]; then
            if [ -z "${git_branch}" ]; then
                local prefix=""
            else
                local prefix="󰊢 ${git_branch}$(parse_git_dirty) "
            fi
            if [ "${timer_show}" -lt 2 ]; then
                local suffix=" 󰄬 "
            else
                local suffix=" (${timer_show}s) 󰄬 "
            fi
            local padding=$((${#suffix} + ${#prefix}))
            echo -e "\e[32m${prefix}${(r:$COLUMNS-${padding}::-:)}${suffix}\e[39m"
        else
            if [ -z "${git_branch}" ]; then
                local prefix="[${ret}] "
            else
                local prefix="[${ret}] 󰊢 ${git_branch}$(parse_git_dirty) "
            fi
            if [ "${timer_show}" -lt 2 ]; then
                local suffix=" 󰅖 "
            else
                local suffix=" (${timer_show}s) 󰅖 "
            fi
            local padding=$((${#suffix} + ${#prefix}))
            echo -e "\e[31m${prefix}${(r:$COLUMNS-${padding}::-:)}${suffix}\e[39m"
        fi
    else
        dash_var=1
    fi
    if [ "$var" != "clear" ] && [ "$var" != "reset" ]; then
        dash_var=1
    else
        dash_var=2
    fi
    unset timer
}
add-zsh-hook -Uz preexec timer
add-zsh-hook -Uz precmd dash_line
if [[ $UID == 0 || $EUID == 0 ]]; then
    export PROMPT=$'%n@%m:%1~%(?..%{\e[31m%}%{\e[39m%})%{\e[95m%}%#%{\e[39m%} '
else
    export PROMPT=$'%n@%m:%1~%(?..%{\e[31m%}%{\e[39m%})%{\e[92m%}λ%{\e[39m%} '
fi
