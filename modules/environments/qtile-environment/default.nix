{ config, pkgs, ... }:

{
    imports = [
        ./custom
        ../../packages.nix
    ];

    home.packages = with pkgs; [ rofi ] ++ default_packages;
}
