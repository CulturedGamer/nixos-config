{ config, pkgs, ... }:

{
    imports = [
        ./misc/firefox.nix

        ./terminal/alacritty
        ./terminal/neovim
        ./terminal/bash.nix
        ./terminal/fish.nix
        ./terminal/git.nix
        ./terminal/starship.nix
        ./terminal/tmux.nix
        ./terminal/lf.nix
    ];
}
