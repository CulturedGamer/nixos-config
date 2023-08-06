{ config, pkgs, ... }:

{
    imports = [
        ./alacritty
        ./neovim-lua
        ./bash.nix
        ./fish.nix
        ./git.nix
        ./lf.nix
        ./starship.nix
    ];
}
