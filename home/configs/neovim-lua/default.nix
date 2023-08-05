{ config, pkgs, ... }:

{
    home.file.".config/nvim/lua/config" = {
        source = ./config;
        recursive = true;
    };
    
    home.file.".config/nvim/lua/plugins" = {
        source = ./plugins;
        recursive = true;
    };

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        plugins = [
            (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
            p.c
            p.lua
            p.rust
            p.yaml
            p.cpp
            ]))
        ];
    };
}
