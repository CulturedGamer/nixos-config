{ config, pkgs, ... }:

{
    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "Kanagawa-B";
            package = pkgs.stdenv.mkDerivation {
                name = "kanagawa-gtk";

                src = builtins.fetchGit {
                    url = "https://github.com/Fausto-Korpsvart/Kanagawa-GKT-Theme";
                    rev = "35936a1e3bbd329339991b29725fc1f67f192c1e";
                    ref = "main";
                };

                installPhase = ''
                    mkdir -p $out/share/themes/Kanagawa-B-LB $out/share/themes/Kanagawa-B $out/share/themes/Kanagawa-BL-LB $out/share/themes/Kanagawa-BL
                    cp -r themes/Kanagawa-B-LB/* $out/share/themes/Kanagawa-B-LB
                    cp -r themes/Kanagawa-B/* $out/share/themes/Kanagawa-B
                    cp -r themes/Kanagawa-BL-LB/* $out/share/themes/Kanagawa-BL-LB
                    cp -r themes/Kanagawa-BL/* $out/share/themes/Kanagawa-BL
                '';
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
