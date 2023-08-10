{ config, pkgs, ... }:

{
    imports = [
        ./alacritty.nix
        ./neovim.nix
        ./tmux.nix
    ];
}
