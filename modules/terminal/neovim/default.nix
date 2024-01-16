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

  harpoon2 = pkgs.vimUtils.buildVimPlugin {
    name = "harpoon";
    src = pkgs.fetchFromGitHub {
      owner = "ThePrimeagen";
      repo = "harpoon";
      rev = "867e212ac153e793f95b316d1731f3ca1894625e";
      sha256 = "0ilawmxl31fm0iw7ql0nnxwnh1k8yyykdc8030w3fjz9yr9vm39n";
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
    home.file.".config/nvim/lua/ftplugin" = {
      source = ./ftplugin;
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
        require ("plugins")

        ${cfg.extraPluginsConfiguration}
        ${cfg.themeConfiguration}
      '';

      plugins = with pkgs.vimPlugins; cfg.extraPlugins ++ [
        cfg.theme

        comment-nvim
        fm-nvim
        gitsigns-nvim
        harpoon
        lf-vim
        neodev-nvim
        neorg
        nvim-autopairs
        nvim-web-devicons
        telescope-nvim
        todo-comments-nvim
        trouble-nvim
        vimtex
        vim-tmux-navigator
        which-key-nvim
        (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.glsl p.java p.lua p.nix p.rust p.zig ]))

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
