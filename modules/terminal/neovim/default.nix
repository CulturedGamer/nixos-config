{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;
        defaultEditor = true;

        plugins = with pkgs.vimPlugins; [
            (nvim-treesitter.withPlugins (p: [ p.nix p.c p.lua p.rust p.yaml p.cpp p.org ]))
        ];
    };
}
