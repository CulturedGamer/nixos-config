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

    # enable the NUR
    nixpkgs.config.packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
            inherit pkgs;
        };
    };

    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
