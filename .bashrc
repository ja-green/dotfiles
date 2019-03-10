# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# if not running interactively, don't do anything
[ -z "${PS1}" ] && return

dotfiles_repo="$(locate dotfiles/.git | head -n 1)/.."

source_files() {
  if [[ -d ${1} ]]; then
    for file in $(find ${1} -type f | sort); do
      . ${file}
    done
  fi
}

source_files ${dotfiles_repo}/bash
export NGT_HOME="$HOME/.ngt"
