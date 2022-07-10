# prompt
export PROMPT='%n:%1~\$ '
autoload -Uz add-zsh-hook
dash_var=0
dash_line() {
   ret=$?
   var=$history[$((HISTCMD - 1))]
   if [ $dash_var -eq 1 ] && [ "$var" != "clear" ]; then
       if [ $ret -eq 0 ]; then
           echo -e "\e[34m${(r:$COLUMNS::-:)}\e[39m"
       else
           echo -e "\e[35m${(r:$COLUMNS::-:)}\e[39m"
       fi
   else
       dash_var=1
   fi
}
add-zsh-hook -Uz precmd dash_line
if [[ $UID == 0 || $EUID == 0 ]]; then
    export PROMPT=$'%n:%1~%(?..%{\e[31m%}[%?]%{\e[39m%})%{\e[95m%}%#%{\e[39m%} '
else
    export PROMPT=$'%n:%1~%(?..%{\e[31m%}[%?]%{\e[39m%})%{\e[94m%}\$%{\e[39m%} '
fi
