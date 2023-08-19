{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = [ pkgs.rofimoji ];
        font = "JetBrainsMonoNerdFont 12";
        theme = ./onedark.rasi;
        extraConfig = {
            display-drun = "Applications: ";
            drun-display-format = "{icon} {name}";
            show-icons = true;
            icon-theme = "Qogir";
        };
    };
}
