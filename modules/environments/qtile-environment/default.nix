{ config, pkgs, ... }:

{
    imports = [
        ./custom
    ];

    home.packages = with pkgs; [ rofi ] ++ import ../../packages.nix;
}
