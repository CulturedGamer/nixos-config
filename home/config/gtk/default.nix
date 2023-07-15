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
    pointerCursor = {
        enable = true;
        size = 40;
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
    };
}
