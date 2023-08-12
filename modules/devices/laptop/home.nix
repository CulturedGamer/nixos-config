{ config, pkgs, ... }:

{
    imports = [
        ../../graphic
        ../../misc
        ../../scripts
        ../../templates
        ../../terminal
        ../../wallpapers

        ./packages.nix
    ];

    home = {
        username = "donny";
        stateVersion = "23.05";
    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;
}
