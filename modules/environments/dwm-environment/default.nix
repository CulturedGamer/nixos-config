{ config, pkgs, ... }:

{
    imports = [
        ./custom
        ../../packages.nix
    ];

    home.packages = with pkgs; [
        dmenu
        slstatus
    ] ++ default_packages;
}
