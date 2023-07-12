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
        ./programming_templates
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };

    programs.dconf.enable = true;

    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
