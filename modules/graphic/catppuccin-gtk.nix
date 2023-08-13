{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "Catppuccin-Mocha-Compact-Blue-dark";
            package = pkgs.catppuccin-gtk.override {
                accents = [ "blue" ];
                size = "compact";
                tweaks = [ "rimless" ];
                variant = "mocha";
            };
        };
        iconTheme = {
            name = "PaperIconTheme";
            package = pkgs.paper-icon-theme;
        };
    };

    home.pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        x11.enable = true;
        gtk.enable = true;
    };
}
