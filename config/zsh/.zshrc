# zsh config

# prompt

autoload -U colors && colors
autoload -U edit-command-line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

PROMPT=
PROMPT+=$'%(?.%{%F{green}%}\U2714.%{%F{red}%}\U2718)%{%F{default}%} '
PROMPT+=$'%T '
PROMPT+=$'%{%F{cyan}%}%~%{%F{default}%} '
PROMPT+=$'%(!.#.$) '

# environment variables

export ZDOTDIR="${HOME}/.config/shell/"

export HISTFILE="${HOME}/.config/shell/.histfile"
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE="/dev/null"

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
alias ..="cd ../"
alias ...="cd ../../"
alias cls="clear"
alias mkf="touch"
alias mkd="mkdir -p"
alias sspl="searchsploit"
alias reload="source ${HOME}/.zshrc"

# completion

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit

# options

setopt nomatch
unsetopt autocd beep extendedglob notify

zle -N edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^xe'  edit-command-line
bindkey '^x^e' edit-command-line

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey -e

# motd

if type motd &>/dev/null; then
    motd
fi
