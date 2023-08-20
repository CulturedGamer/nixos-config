{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = "JetBrainsMonoNerdFont 11.5";
        terminal = "${pkgs.alacritty}/bin/alacritty -e fish";
        theme = ./onedark.rasi;
        extraConfig = {
            display-dmenu = " ";
            display-drun = "󰀻 ";
            display-run = " ";
            drun-display-format = "{icon} {name}";
            show-icons = true;
            icon-theme = "Qogir";
        };
    };
}
