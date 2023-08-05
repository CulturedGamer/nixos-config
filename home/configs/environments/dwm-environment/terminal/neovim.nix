{ config, pkgs, ... }:

{
    home.file = {
        ".config/nvim/init.lua".text = ''
            require('config.settings')
            require('config.keymaps')
            require('config.lazy')

            vim.cmd.colorscheme 'rose-pine'
        '';

        ".config/nvim/lua" = {
            source = ../../../neovim-lua;
            recursive = true;
        };
    };
}
