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

                modules-left = [ "hyprland/workspaces" "hyprland/window" ];
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
                    format-alt = "󰨣 {free} free";
                    on-click-right = "nemo";
                    path = "/";
                };

                memory = {
                    format = "󰍹 {}%";
                    format-alt = "󰍹 {used}GiB";
                    on-click-right = "alacritty -e htop";
                };

                network = {
                    format = "{icon}";
                    format-alt = "{essid} ({signalStrength}%) {icon}";
                    format-icons = [ "󰤯" "󰤟" "󰤢" "󰤢" "󰤨" ];
                    on-click-right = "alacritty -e nmcli";
                };

                pulseaudio = {
                    format = "{icon} {volume}%";
                    format-alt = "{icon} {desc}";
                    format-bluetooth = "{icon}󰂯 {volume}%";
                    format-muted = "󰝟";
                    format-icons = {
                        default = [ "" "" ];
                    };
                    on-click-right = "pavucontrol";
                };
            };
        };
        style = ./style.css;
    };
}
