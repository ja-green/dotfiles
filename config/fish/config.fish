set -gx EDITOR nvim
set -gx PAGER  less

alias vi='nvim'
alias ll='ls -alF --group-directories-first'
alias xi='xclip -i -selection clipboard'
alias xo='xclip -o -selection clipboard'

function prompt_branch_info --description 'git branch information'
  for x in (git status --porcelain | cut -c2 | uniq)
    switch $x
      case 'M'; set m "$c3\u25CF$c0"
      case 'U'; set m "$c3\u25CF$c0"
      case 'T'; set m "$c3\u25CF$c0"
      case 'D'; set d "$c1\u25CF$c0"
      case '?'; set z "$c4\u25CF$c0"
      case 'A'; set a "$c2\u25CF$c0"
      case 'C'; set c "$c6\u25CF$c0"
      case 'R'; set r "$c5\u25CF$c0"
    end
  end

  set bits "$m$d$z$a$c$r"

  if test -z $bits
    printf "$branch | $c2\u2714$c0"
  else
    printf "$branch | $c2$bits$c0"
  end
end

function prompt_char --description 'print prompt character'
  if test $USER = 'root'
    printf '#'
  else
    printf '$'
  end
end

function prompt_exit_status --description 'print exit status char'
  if test $last_exit -eq 0
    printf "$c2\u2714$c0"
  else
    printf "$c1\u2718$c0"
  end
end

function get_git_info --description 'parse git-rev-parse output for repo info'
  set -g branch (git rev-parse --abbrev-ref HEAD ^/dev/null)

  if test $status -ne 0
    set -e branch
    set -e in_gitdir
    set -e in_worktree
    set -e toplevel

    return
  end

  set -g in_worktree (git rev-parse --is-inside-work-tree ^/dev/null)
  set -g in_gitdir   (git rev-parse --is-inside-git-dir   ^/dev/null)

  if test $in_gitdir = 'true'
    set -g toplevel (basename (git ls-remote --get-url) .git)
  else
    set -g toplevel (basename (git rev-parse --show-toplevel))
  end

  if test $branch = 'HEAD'
    set -g branch :(git rev-parse --short HEAD)
  end
end

function prompt_cwd --description 'format cwd for fish prompt'
  set -q in_gitdir;   or set -g in_gitdir   false
  set -q in_worktree; or set -g in_worktree false

  if test $in_gitdir = 'true'
    printf "$cc$toplevel"(string replace -r ".*/$toplevel" "" -- "$PWD")"$c0 [$c1 gitdir$c0 ]"

  else if test $in_worktree = 'true'
    printf "$cc$toplevel"(string replace -r ".*/$toplevel" "" -- "$PWD")"$c0 [ "(prompt_branch_info)" ]"

  else
    printf "$cc$PWD$c0"
  end
end

function fish_prompt --description 'fish prompt string'
  set -g last_exit $status

  set -g c0 (set_color normal)
  set -g c1 (set_color red)
  set -g c2 (set_color green)
  set -g c3 (set_color yellow)
  set -g c4 (set_color blue)
  set -g c5 (set_color magenta)
  set -g c6 (set_color cyan)
  set -g cc (set_color brmagenta)

  get_git_info

  printf "%s %s %s %s "  \
    (prompt_exit_status) \
    (date +%H:%M)        \
    (prompt_cwd)         \
    (prompt_char)
end
