{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.neovim;

  fm-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "fm-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "is0n";
      repo = "fm-nvim";
      rev = "8e6a77049330e7c797eb9e63affd75eb796fe75e";
      sha256 = "0lc97r9phdx9adlcj6zlv0lvk34ijc6j3n9h5p5iynpqqg9njvr3";
    };
  };
in
{
  options.modules.neovim = {
    enable = mkEnableOption "Neovim";

    extraPlugins = mkOption {
      type = types.listOf types.package;
      default = [ ];
      example = literalExpression ''
        [
          pkgs.vimPlugins.bufferline-nvim
          pkgs.vimPlugins.lualine-nvim
          pkgs.vimPlugins.nvim-tree-lua
        ]
      '';
      description = "List of extra packages";
    };

    extraPluginsConfiguration = mkOption {
      type = types.str;
      default = "";
      example = literalExpression ''
        require("bufferline").setup()
        require("nvim-tree").setup()
        require("lualine").setup()
      '';
      description = "Extra plugins configuration";
    };

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

    # language servers
    home.packages = with pkgs; [
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
        require ("autocmds")
        require ("plugins")

        ${cfg.extraPluginsConfiguration}
        ${cfg.themeConfiguration}
      '';

      plugins = with pkgs.vimPlugins; cfg.extraPlugins ++ [
        cfg.theme

        comment-nvim
        flash-nvim
        fm-nvim
        gitsigns-nvim
        harpoon
        lf-vim
        neorg
        nvim-autopairs
        nvim-web-devicons
        telescope-nvim
        todo-comments-nvim
        trouble-nvim
        vimtex
        vim-tmux-navigator
        which-key-nvim
        (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.java p.lua p.nix p.zig ]))

        # completion
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        luasnip
        cmp_luasnip
        friendly-snippets
        nvim-lspconfig
      ];
    };
  };
}
