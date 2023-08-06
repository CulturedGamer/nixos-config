{ config, pkgs, ... }:

{
    imports = [
        ./wallpaper
        ./bookmarks.nix
        ./firefox.nix
        ./picom.nix
    ];
}
