{ config, pkgs, ... }:

{
    home.file = {
        ".config/nvim/init.lua".text = ''
            require('config.settings')
            require('config.keymaps')
            require('config.lazy')

            vim.cmd.colorscheme 'base16-ayu-dark'
        '';
    };
}
