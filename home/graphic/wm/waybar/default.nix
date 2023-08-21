{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar-hyprland;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 10;
                output = [ "eDP-1" ];

                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "pulseaudio" "upower" "clock" ];

                clock = {
                    interval = 60;
                    format = " {:%I:%M}";
                    max-length = 25;
                };
            };
        };
        style = ./style.css;
    };
}
