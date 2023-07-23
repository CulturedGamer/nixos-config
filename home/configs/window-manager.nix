{ config, pkgs, ... }:

{
    imports = [
        ./display/wallpaper
        # ./display/gtk.nix
        ./display/picom.nix
        ./display/qtile.nix
        ./display/xinit.nix

        ./terminal/alacritty
        ./terminal/neovim
        ./terminal/bash.nix
        ./terminal/fish.nix
        ./terminal/git.nix
        ./terminal/starship.nix
        ./terminal/tmux.nix
        ./terminal/lf.nix

        ./misc/rofi
        ./misc/bookmarks.nix
        ./misc/firefox.nix
        ./misc/sxhkd.nix
    ];

}
