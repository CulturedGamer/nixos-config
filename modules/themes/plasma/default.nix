{ pkgs, ... }:

/* Assumes that plasma is already enabled */
{
  imports = [
    ../global.nix

    ../../terminal/alacritty.nix
    ../../terminal/tmux.nix
    ../../terminal/neovim
  ];

  modules = {
    # Terminal
    alacritty = {
      enable = true;
      colorscheme = "onedark";
      font = "inconsolata";
      opacity = 1;
    };

    neovim = {
      enable = true;
      extraPlugins = with pkgs.vimPlugins; [
        bufferline-nvim
        lualine-nvim
      ];
      extraPluginsConfiguration = ''
        require("bufferline").setup()
        require("lualine").setup()
      '';
      theme = pkgs.vimPlugins.onedark-nvim;
      themeConfiguration = ''
        require("onedark").setup { style = "darker" }
        require("onedark").load()
      '';
    };

    tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [ onedark-theme ];
    };
  };
}
