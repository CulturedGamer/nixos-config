{ config, pkgs, ... }:

{
    imports = [
        ./custom
        ../../packages.nix
    ];

    home.packages = default_packages;
}
