{ config, pkgs, ... }:

{
    home = {
        username = "donny";
        homeDirectory = "/home/donny";
    };

    fonts.fontconfig.enable = true;

    imports = [
        ./packages.nix
        ./config
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };

    programs.home-manager.enable = true;
}
