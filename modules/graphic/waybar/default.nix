{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.waybar;
in {
    options.modules.waybar = {
        enable = mkEnableOption "Waybar";

        theme = mkOption {
            type = types.nullOr types.path;
            default = null;
            description = "Custom Waybar theme";
        };

        wmModules = mkOption {
            type = types.listOf types.str;
            default = [ ];
            description  = "Modules specific to the current compositor";
        };
    };

    config = mkIf cfg.enable {
        programs.waybar = {
            enable = true;
            package = pkgs.waybar;
            settings = {
                mainBar = {
                    layer = "top";
                    position = "top";
                    height = 15;
                    output = [ "eDP-1" ];

                    modules-left = cfg.wmModules;
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
                        format-alt = "{icon} {description}";
                        format-bluetooth = "{icon}󰂯 {volume}%";
                        format-muted = "󰝟";
                        format-icons = {
                            default = [ "" "" ];
                        };
                        on-click-right = "pavucontrol";
                    };

                    river.tags = {
                        num-tags = 9;
                        tag-labels = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" ];
                    };
                };
            };
            style = cfg.theme;
        };
    };
}
