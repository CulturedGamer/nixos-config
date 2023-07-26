{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "GruvboxDark";
            package = pkgs.gruvbox-dark-gtk;
        };
        # iconTheme = {
        #     name = "PaperIconTheme";
        #     package = pkgs.paper-icon-theme;
        # };
    };
}
