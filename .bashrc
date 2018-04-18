# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

BASH_PROFILE=${HOME}/.bashprofile

source_files() {
  if [[ -d $1 ]]; then
    for file in $(find $1 -type f); do
      . ${file}
    done
  fi
}

source_files ${BASH_PROFILE}/common
source_files ${BASH_PROFILE}/scripts
source_files ${BASH_PROFILE}/private
source_files ${BASH_PROFILE}/bin

