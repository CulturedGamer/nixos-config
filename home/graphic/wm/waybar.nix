{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar-hyprland;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                output = [ "eDP-1" ];

                modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
                modules-center = [ "hyprland/window" ];
                modules-right = [ "pulseaudio" "upower" "clock" ];
            };
        };
        # style = {};
    };
}
