{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "SolArc-Dark";
            package = pkgs.solarc-gtk-theme;
        };
    };
}
