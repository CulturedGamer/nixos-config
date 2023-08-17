{ config, pkgs, ... }:

{
    programs.neovim = {
        enable = true;

        extraConfig = ''
            luafile /etc/nixos/modules/terminal/neovim-nix/config/settings.lua
            luafile /etc/nixos/modules/terminal/neovim-nix/config/keymaps.lua
        '';

        plugins = with pkgs.vimPlugins; [
            # plugins todo list:
            # cmp setup
            # lsp setup
            # treesitter setup
            # colorscheme plugin

            trouble-nvim
            vim-fugitive
            vim-tmux-navigator

            {
                plugin = gitsigns-nvim;
                config = '' lua require("gitsigns").setup() '';
            }

            {
                plugin = nvim-autopairs;
                config = '' lua require("nvim-autopairs").setup() '';
            }

            {
                plugin = comment-nvim;
                config = '' lua require("Comment").setup() '';
            }

            {
                plugin = nvim-tree-lua;
                config = '' lua require("nvim-tree").setup() '';
            }

            {
                plugin = onedark-nvim;
                config = '' lua require("onedark").setup { style = "darker" } '';
            }

            {
                plugin = orgmode;
                config = '' lua require("orgmode").setup() '';
            }

            {
                plugin = todo-comments-nvim;
                config = '' lua require("todo-comments").setup() '';
            }

            # Plugins with external configuration files

            {
                plugin = bufferline-nvim;
                config = '' luafile /etc/nixos/modules/terminal/neovim-nix/plugins/bufferline.lua '';
            }

            {
                plugin = flash-nvim;
                config = '' luafile /etc/nixos/modules/terminal/neovim-nix/plugins/flash.lua '';
            }

            {
                plugin = lualine-nvim;
                config = '' luafile /etc/nixos/modules/terminal/neovim-nix/plugins/lualine.lua '';
            }

            {
                plugin = nvim-treesitter.withAllGrammars;
                config = '' luafile /etc/nixos/modules/terminal/neovim-nix/plugins/treesitter '';
            }

            {
                plugin = telescope-nvim;
                config = '' luafile /etc/nixos/modules/terminal/neovim-nix/plugins/telescope.lua '';
            }
        ];
    };
}
