{ config, pkgs, ... }:

{
    imports = [
        ./templates
        ./terminal
        ./desktop

        ./packages.nix
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };

    home = {
        username = "donny";
    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;
    home.stateVersion = "23.11";
}
