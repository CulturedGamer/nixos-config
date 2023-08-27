{ pkgs, ... }:

{
    home.file.".config/nvim/lua/settings.lua".source = ./settings.lua;
    home.file.".config/nvim/lua/keymaps.lua".source = ./keymaps.lua;
    home.file.".config/nvim/lua/plugins" = {
        source = ./plugins;
        recursive = true;
    };

    home.packages = with pkgs; [ # language servers
        clang-tools
        lua-language-server
        nil
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;

        extraLuaConfig = ''
           require ("settings")
           require ("keymaps")
           require ("plugins")
        '';

        plugins = with pkgs.vimPlugins; [
            bufferline-nvim
            comment-nvim
            flash-nvim
            gitsigns-nvim
            lualine-nvim
            nvim-autopairs
            nvim-tree-lua
            nvim-treesitter.withAllGrammars
            nvim-web-devicons
            onedark-nvim
            orgmode
            telescope-nvim
            todo-comments-nvim
            toggleterm-nvim
            trouble-nvim
            vimtex
            vim-fugitive
            vim-tmux-navigator
            which-key-nvim

            # completion
            nvim-cmp
            cmp-nvim-lsp
            cmp-buffer
            cmp-path
            cmp-cmdline
            luasnip
            cmp_luasnip
            friendly-snippets

            # lsp
            nvim-lspconfig
            nvim-navic
        ];
    };
}
