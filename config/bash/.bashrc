# bash config

test -z "${PS1}" && return

# prompt

ppt_exit_status() {
    if test "${?}" = "0"; then
        echo -e "\001\e[0;32m\002\u2714\001\e[0m\002"
    else
        echo -e "\001\e[0;31m\002\u2718\001\e[0m\002"
    fi
}

ppt_time() {
    date +%H:%M
}

ppt_path() {
    echo -e "\001\e[0;36m\002${PWD//$HOME/\~}\001\e[0m\002"
}

ppt_prompt() {
    if test "${EUID}" = "0"; then
        echo "#"
    else
        echo "$"
    fi
}

bash_prompt() {
    printf '(bash) %s %s %s %s ' \
      "$(ppt_exit_status)" \
      "$(ppt_time)"        \
      "$(ppt_path)"        \
      "$(ppt_prompt)"
}

PS1='$(bash_prompt)'

# environment variables

export HISTFILE="${HOME}/.config/shell/.histfile"
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE="/dev/null"
export TASKRC="${HOME}/.config/task/.taskrc"

export EDITOR='nvim'
export PAGER='less'
export BROWSER='qutebrowser'

# aliases

alias l="ls -aF --color=always"
alias xi='xclip -i -selection clipboard'
alias xo='xclip -o -selection clipboard'
alias ll="ls -laF --color=always --group-directories-first"
alias vi="nvim"
alias qt="qutebrowser"
alias nc='ncat'
alias ..="cd ../"
alias ...="cd ../../"
alias cls="clear"
alias mkf="touch"
alias mkd="mkdir -p"
alias sspl="searchsploit --id"
alias reload="source ${HOME}/.bashrc"

# motd

if type motd &>/dev/null; then
    motd
fi
