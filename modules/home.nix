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
        stateVersion = "23.05";
    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;
}
