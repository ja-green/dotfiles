# key remappings

# prefix
set-option -g prefix M-a

# bindings
bind-key -n M-q     kill-pane
bind-key -n M-Q     kill-window

bind-key -n M-Left  select-pane -L
bind-key -n M-Right select-pane -R
bind-key -n M-Up    select-pane -U
bind-key -n M-Down  select-pane -D

bind-key -n M-h     select-pane -L
bind-key -n M-j     select-pane -R
bind-key -n M-k     select-pane -U
bind-key -n M-l     select-pane -D

bind-key -n M-h     split-window -h
bind-key -n M-v     split-window -v
bind-key -n M-Enter new-window

bind-key -n M-1     select-window -t 1
bind-key -n M-2     select-window -t 2
bind-key -n M-3     select-window -t 3
bind-key -n M-4     select-window -t 4
bind-key -n M-5     select-window -t 5
bind-key -n M-6     select-window -t 6
bind-key -n M-7     select-window -t 7
bind-key -n M-8     select-window -t 8
bind-key -n M-9     select-window -t 9
bind-key -n M-0     select-window -t :10

# copy mode
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

# vim: set ft=tmux:
