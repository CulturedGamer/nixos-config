{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "Qogir-Dark";
            package = pkgs.qogir-theme;
        };
        iconTheme = {
            name = "PaperIconTheme";
            package = pkgs.paper-icon-theme;
        };
    };
    xsession = {
        enable = true;
        pointerCursor = {
            size = 40;
            package = pkgs.nur.repos.ambroisie.vimix-cursors;
            name = "Vimix-cursors";
        };
    };
}
