# zsh config

# modules

autoload -U colors && colors
autoload -U edit-command-line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

# environment variables

export ZDOTDIR="${HOME}/.config/shell/"

export HISTFILE="${HOME}/.config/shell/.histfile"
export HISTSIZE=1000
export SAVEHIST=1000
export LESSHISTFILE="/dev/null"
export TASKRC="${HOME}/.config/task/.taskrc"

export EDITOR='nvim'
export PAGER='less'
export BROWSER='qutebrowser'

export TIMEFMT='%J / %U user %S system %P cpu %*E total (%mE)'

FZF_DEFAULT_OPTS=
FZF_DEFAULT_OPTS+='--tiebreak=begin '
FZF_DEFAULT_OPTS+='--preview="cat {}" '
FZF_DEFAULT_OPTS+='--tabstop=4 '
FZF_DEFAULT_OPTS+='--info=inline '
FZF_DEFAULT_OPTS+='--color=bw,fg:#dadada,preview-fg:#dadada,hl:#e0bf80 '
FZF_DEFAULT_OPTS+='--color=fg+:#dadada,bg+:#3a3c4a,hl+:#e0bf80,info:#5e8d87 '
FZF_DEFAULT_OPTS+='--color=border:#dadada,prompt:#5e8d87,pointer:#5e8d87 '
FZF_DEFAULT_OPTS+='--color=marker:#5e8d87,spinner:#dadada,header:#5e8d87 '
FZF_DEFAULT_OPTS+='--no-bold '
FZF_DEFAULT_OPTS+='--preview-window=right:sharp:nowrap '

export FZF_DEFAULT_OPTS

# prompt

# PROMPT=
# PROMPT+=$'%(?.%{%F{green}%}\U2714.%{%F{red}%}\U2718)%{%F{default}%} '
# PROMPT+=$'%T '
# PROMPT+=$'%{%F{cyan}%}%~%{%F{default}%} '
# PROMPT+=$'%(!.#.$) '

setopt prompt_subst

precmd() {
    PROMPT=
    PROMPT+=$'%(?.%{%F{green}%}\U2714.%{%F{red}%}\U2718)%{%F{default}%} '
    PROMPT+=$'%T '

    repo_info="$(git rev-parse \
        --is-bare-repository   \
        --is-inside-work-tree  \
        --is-inside-git-dir    \
        --absolute-git-dir     \
        --abbrev-ref HEAD 2>/dev/null)"

    is_bare_repo="${repo_info%%$'\n'*}";       repo_info="${repo_info#*$'\n'}"
    is_inside_worktree="${repo_info%%$'\n'*}"; repo_info="${repo_info#*$'\n'}"
    is_inside_gitdir="${repo_info%%$'\n'*}";   repo_info="${repo_info#*$'\n'}"
    absolute_gitdir="${repo_info%%$'\n'*}";    repo_info="${repo_info#*$'\n'}"

    toplevel="${absolute_gitdir%/*}"
    toplevel_name="${toplevel##*/}"
    prefix="${PWD#$toplevel}"

    branch="${repo_info%%$'\n'*}"
    commit="%{%F{green}%}$(git rev-parse --short HEAD 2>/dev/null)%{%F{default}%}"

    if test "${branch}" = "HEAD"; then
        branch_ref=":${commit}"
    else
        branch_ref="${branch}/${commit}"
    fi

    if test "${is_bare_repo}" = "true"; then
        dir_path="%{%F{cyan}%}${toplevel_name}${prefix}%{%F{default}%}"
        git_info="[ none | %{%F{blue}%}bare%{%F{default}%} ] "
    elif test "${is_inside_gitdir}" = "true"; then
        dir_path="%{%F{cyan}%}${toplevel_name}${prefix}%{%F{default}%}"
        git_info="[ ${branch_ref} ] "
    elif test "${is_inside_worktree}" = "true"; then
        dir_path="%{%F{cyan}%}${toplevel_name}${prefix}%{%F{default}%}"
        git_info="[ ${branch_ref} ] "
    else
        dir_path="%{%F{cyan}%}%~%{%F{default}%}"
        git_info=""
    fi

    PROMPT+=$'${dir_path} ${git_info}'
    PROMPT+=$'%(!.#.$) '
}

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
alias tree="tree -aqC --dirsfirst"
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

# dircolors

eval "$(dircolors "${HOME}/.config/dircolors/config")"

# motd

if type motd &>/dev/null; then
    motd
fi
