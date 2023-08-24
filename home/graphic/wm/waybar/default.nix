{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [ "eDP-1" ];

                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "tray" "network" "battery" "disk"  "memory" "backlight" "pulseaudio" "clock" ];

                backlight = {
                    format = "{icon} {percent}%";
                    format-icons = [ "" "" ];
                };

                battery = {
                    format = "{icon} ";
                    format-alt = "{icon} {capacity}%";
                    format-icons = [" " " " " " " " " "];
                    states = {
                        warning = 30;
                        critical = 10;
                    };
                };

                clock = {
                    format = " {:%I:%M}";
                    format-alt = " {:%m/%d/%Y}";
                };

                disk = {
                    format = "󰨣 {percentage_free}%";
                    on-click = "nemo";
                };

                memory = {
                    format = "󰍹 {}%";
                    on-click = "alacritty -e htop";
                };

                network = {
                    format = "{icon}";
                    format-alt = "{essid} ({signalStrength}%) {icon}";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤢" "󰤨" ];
                };

                pulseaudio = {
                    format = "{icon} {volume}%";
                    format-bluetooth = "{icon}󰂯 {volume}%";
                    format-muted = "󰝟";
                    format-icons = {
                        default = [ "" "" ];
                    };
                    on-click = "pavucontrol";
                };
            };
        };
        style = ./style.css;
    };
}
