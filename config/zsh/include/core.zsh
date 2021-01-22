# options
setopt appendhistory     # append history items
setopt histignorealldups # remove duplicated history items
setopt histignoredups    # do not duplicate history items
setopt histignorespace   # ignore items beginning with a space
setopt histnofunctions   # do not add functions to histfile
setopt histnostore       # do not add fc -l to histfile
setopt histreduceblanks  # remove superfluous blanks from histfile items
setopt histverify        # load history items to buffer rather than execute
setopt sharehistory      # immediately add and load history items
setopt correctall        # try to correct spelling of all arguments
setopt checkjobs         # report jobs on shell exit
setopt promptsubst       # allow expansion in prompts

# modules
fpath=("${ZDOTDIR}/functions/" "${fpath[@]}")

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
autoload -z  edit-command-line
autoload -Uz compinit && compinit

# zle
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N edit-command-line

# keys
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey "^X^E" edit-command-line

# alias
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
alias gdb="gdb --nh -x '${HOME}/.config/gdb/gdbinit'"
alias sspl="searchsploit --id"
alias tree="tree -aqC --dirsfirst"
alias reload="source ${ZDOTDIR}/.zshrc"
alias ncpamixer="ncpamixer -c '${HOME}/.config/ncpamixer/config'"
alias mitmproxy="mitmproxy --set confdir=${HOME}/.config/mitmproxy"
alias mitmweb="mitmweb --set confdir=${HOME}/.config/mitmproxy"
