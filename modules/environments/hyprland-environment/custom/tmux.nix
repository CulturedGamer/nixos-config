{ config, pkgs, ... }:

{
    programs.tmux = {
        enable = true;
        plugins = [ pkgs.tmuxPlugins.vim-tmux-navigator ];
        extraConfig = ''
            # vim style tmux config

            # use C-a, since it's on the home row and easier to hit than C-b
            set-option -g prefix 'C-space'
            unbind-key 'C-space'
            bind-key 'C-space' send-prefix
            set -g base-index 1

            # Easy config reload
            bind-key R source-file /etc/tmux.conf \; display-message "tmux.conf reloaded."
            
            set-option -g default-shell "\${pkgs.fish}/bin/fish"

            # vi is good
            setw -g mode-keys vi

            # mouse behavior
            setw -g mouse on

            set-option -g default-terminal "xterm-256color"
            set-option -ga terminal-overrides ",xterm-256color:Tc"

            bind-key : command-prompt
            bind-key r refresh-client

            bind-key space next-window
            bind-key bspace previous-window
            bind-key enter next-layout

            # use vim-like keys for splits and windows
            bind-key v split-window -h -c "#{pane_current_path}"
            bind-key s split-window -v -c "#{pane_current_path}"
            bind-key e split-window -v -c "#{pane_current_path}" \; resize-pane -D 10
            bind-key h select-pane -L
            bind-key j select-pane -D
            bind-key k select-pane -U
            bind-key l select-pane -R
            bind -r H resize-pane -L 5
            bind -r J resize-pane -D 5
            bind -r K resize-pane -U 5
            bind -r L resize-pane -R 5
            unbind-key M-d
            bind-key -n M-d kill-pane

            # smart pane switching with awareness of vim splits
            bind -n C-h run "tmux select-pane -L"
            bind -n C-j run "tmux select-pane -D"
            bind -n C-k run "tmux select-pane -U"
            bind -n C-l run "tmux select-pane -R"
            # bind -n 'C-\' run "tmux select-pane -l"
            bind -n C-p send-keys "C-l"

            bind-key C-o rotate-window

            bind-key + select-layout main-horizontal
            bind-key = select-layout main-vertical

            set-window-option -g other-pane-height 25
            set-window-option -g other-pane-width 80
            set-window-option -g display-panes-time 1500
            set-window-option -g window-status-current-style fg=magenta

            bind-key a last-pane
            bind-key q display-panes
            bind-key c new-window
            bind-key t next-window
            bind-key T previous-window

            bind-key [ copy-mode
            bind-key ] paste-buffer

            # Setup 'v' to begin selection as in Vim
            bind-key -T copy-mode-vi v send -X begin-selection
            bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

            # Update default binding of `Enter` to also use copy-pipe
            unbind -T copy-mode-vi Enter
            bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

            # Configure pane
            # set -g status-style 'bg=#1a1b26 fg=#c0caf5'
            # set -g status-style 'bg=#1d2021 fg=#A89984'
            # set -g status-style 'bg=#1f2329 fg=#a0a8b7'
            # set -g status-style 'bg=#1E1E1E fg=#D4D4D4'
            # set -g status-style 'bg=#181818 fg=#d8d8d8'
            set -g status-style 'bg=#0f1419 fg=#e6e1cf'

            set-option -g pane-active-border-style fg=yellow
            set-option -g pane-border-style fg=cyan

            # Set window notifications
            setw -g monitor-activity on
            set -g visual-activity on

            # Allow the arrow key to be used immediately after changing windows
            set-option -g repeat-time 1000
            set-option -g escape-time 0
        '';
    };
}