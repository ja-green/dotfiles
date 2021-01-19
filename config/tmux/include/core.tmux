# tmux core settings

set-option        -sg escape-time              1
set-option        -g  mouse                    on
set-option        -s  default-terminal         tmux-256color
set-option        -ga terminal-overrides       ',*:Tc'
set-option        -g  display-time             1000
set-option        -g  allow-rename             off
set-option        -g  base-index               1
set-option        -g  visual-activity          on
set-option        -g  pane-border-style        "fg=colour0"
set-option        -g  pane-active-border-style "fg=colour0"

set-window-option -g  pane-base-index          1
set-window-option -g  monitor-activity         on
set-window-option -g  mode-keys                vi

# vim: set ft=tmux:
