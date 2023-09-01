{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.tmux;
in {
    options.modules.tmux = {
        enable = mkEnableOption "Tmux";

        plugins = mkOption {
            type = types.listOf types.package;
            default = [ ];
            example = literalExpression ''
                [
                    pkgs.tmuxPlugins.onedark-theme
                    pkgs.tmuxPlugins.cpu
                    pkgs.tmuxPlugins.weather
                ]
            '';
            description = "Install plugins";
        };

        pluginsConfiguration = mkOption {
            type = types.str;
            default = "";
            example = literalExpression ''
                set -g @onedark_time_format "%I:%M %p";
                set -g @onedark_date_format "%D"
            '';
            description = "Configuration for installed plugins";
        };
    };

    config = mkIf cfg.enable {
        programs.tmux = {
            enable = true;

            escapeTime = 0;
            keyMode = "vi";
            mouse = true;
            sensibleOnTop = false;
            shell = "\\${pkgs.fish}/bin/fish";
            terminal = "xterm-256color";

            plugins = cfg.plugins;

            extraConfig = ''
                set-option -g prefix 'C-space'
                unbind-key 'C-space'
                bind-key 'C-space' send-prefix
                set -g base-index 1

                bind-key R source-file /etc/tmux.conf \; display-message "tmux.conf reloaded."
                
                set-option -ga terminal-overrides ",xterm-256color:Tc"

                bind-key : command-prompt
                bind-key r refresh-client

                bind-key space next-window
                bind-key bspace previous-window
                bind-key enter next-layout

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

                bind-key -T copy-mode-vi v send -X begin-selection
                bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

                unbind -T copy-mode-vi Enter
                bind-key -T copy-mode-vi Enter send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

                set-option -g pane-active-border-style fg=yellow
                set-option -g pane-border-style fg=cyan

                # setw -g monitor-activity on
                # set -g visual-activity on

                set-option -g repeat-time 1000
                
                # Smart pane switching with awareness of Vim splits.
                # See: https://github.com/christoomey/vim-tmux-navigator
                is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
                    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'"
                bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
                bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
                bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
                bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
                tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
                if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
                    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
                if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
                    "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

                bind-key -T copy-mode-vi 'C-h' select-pane -L
                bind-key -T copy-mode-vi 'C-j' select-pane -D
                bind-key -T copy-mode-vi 'C-k' select-pane -U
                bind-key -T copy-mode-vi 'C-l' select-pane -R
                bind-key -T copy-mode-vi 'C-\' select-pane -l

                ${cfg.pluginsConfiguration}
            '';
        };
    };
}
