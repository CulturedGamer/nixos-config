{ config, pkgs, ... }:

{
    imports = [
        ./rofi
        ./alacritty.nix
        ./gtk.nix
        ./hyprland.nix
        ./neovim.nix
        ./tmux.nix
    ];
}
