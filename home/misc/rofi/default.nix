{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = "RobotoMonoNerdFont 10";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        theme = ./onedark.rasi;
        extraConfig = {
            display-drun = "󰀻 ";
            display-run = " ";
            drun-display-format = "{icon} {name}";
            show-icons = true;
            icon-theme = "Qogir";
        };
    };
}
