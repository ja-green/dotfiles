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
