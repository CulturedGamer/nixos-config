{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.neovim;
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
        require ("plugins")

        ${cfg.extraPluginsConfiguration}
        ${cfg.themeConfiguration}
      '';

      plugins = with pkgs.vimPlugins; cfg.extraPlugins ++ [
        cfg.theme

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
        nvim-lspconfig
      ];
    };
  };
}
