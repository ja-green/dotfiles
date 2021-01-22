set-option -g  status-position     bottom
set-option -g  status-justify      left
set-option -g  status-style        'bg=colour0 fg=colour15'
set-option -g  status-left-length  20
set-option -g  status-right-length 100
set-option -g  status-interval     2
set-option -g  message-style       'bg=colour11,fg=#000000'

set-option -g  status-left         '#S:#{client_tty} '

set-option -g  status-right        '#{?#(xivy -C #{pane_current_path} git-branch),#(xivy --color tmux -C #{pane_current_path} git-branch),}'
set-option -ga status-right        '#{?#(xivy -C #{pane_current_path} git-ref),(#[fg=green]#(xivy -C #{pane_current_path} git-commit-short)#[fg=default]) ,}'
set-option -ga status-right        '#{?#(xivy -C #{pane_current_path} git-ref),#(printf '\u2192') #(xivy -C #{pane_current_path} git-remote-branch),}'
set-option -ga status-right        '#{?#(xivy -C #{pane_current_path} git-ref),(#[fg=green]#(xivy -C #{pane_current_path} git-remote-commit-short)#[fg=default]) ,}'
set-option -ga status-right        '#{?#(xivy -C #{pane_current_path} git-ref),#(xivy --color tmux -C #{pane_current_path} git-remote-status-fetch) ,}'
set-option -ga status-right        '#{?#(xivy -C #{pane_current_path} git-ref),#(xivy --color tmux -C #{pane_current_path} --color tmux git-status),}'

# vim: set ft=tmux:
