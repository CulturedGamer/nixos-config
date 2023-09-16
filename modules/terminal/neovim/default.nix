{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.neovim;

    transparent-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "transparent-nvim";
        src = pkgs.fetchFromGitHub {
            owner = "xiyaowong";
            repo = "transparent.nvim";
            rev = "3af6232c8d39d51062702e875ff6407c1eeb0391";
            sha256 = "17imywr9kxprw5c0d9c0vfxkbn06asacr2y3ka7x1d22f309z76l";
        };
    };
in {
    options.modules.neovim = {
        enable = mkEnableOption "Neovim";

        theme = mkOption {
            type = types.nullOr types.package;
            default = null;
            description = "Installs a theme for Neovim";
        };

        themeConfiguration = mkOption {
            type = types.nullOr types.str;
            default = null;
            example = literalExpression ''
                require("onedark").setup { style = "darker" }
                require("onedark").load()
            '';
            description = "Configuration for theme";
        };
    }; 

    config = mkIf cfg.enable {
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

               ${cfg.themeConfiguration}
            '';

            plugins = with pkgs.vimPlugins; [
                cfg.theme
                transparent-nvim

                comment-nvim
                flash-nvim
                gitsigns-nvim
                harpoon
                nvim-autopairs
                nvim-treesitter.withAllGrammars
                nvim-web-devicons
                orgmode
                telescope-nvim
                todo-comments-nvim
                trouble-nvim
                vimtex
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
            ];
        };
    };
}
