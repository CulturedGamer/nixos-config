{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        font = "JetBrainsMonoNerdFont 11.5";
        theme = ./onedark.rasi;
        extraConfig = {
            display-drun = " ";
            display-run = " ";
            drun-display-format = "{icon} {name}";
            show-icons = true;
            icon-theme = "Qogir";
        };
    };
}
