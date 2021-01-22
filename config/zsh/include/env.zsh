# taskwarrior
export TASKRC="${HOME}/.config/task/.taskrc"

# pylint
export PYLINTHOME="${HOME}/.local/share/pylint/"

# programs
export EDITOR='nvim'
export PAGER='less'
export BROWSER='qutebrowser'

# zsh
export TIMEFMT='time %U user %S system %P cpu %*E total (%mE)'
export HISTFILE="${ZDOTDIR}/.histfile"
export SAVEHIST=1000000
export HISTFILESIZE=1000000
export HISTSIZE=1000000

# fzf
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

# dircolors
eval "$(dircolors "${HOME}/.config/dircolors/config")"
