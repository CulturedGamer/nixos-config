{ pkgs, ... }:

{
  imports = [
    ../../desktop/river.nix

    ../../misc/wallpapers.nix

    ../../terminal/alacritty.nix
    ../../terminal/tmux.nix
    ../../terminal/neovim

    ../../graphic/rofi
    ../../graphic/waybar/default.nix

    ../global.nix
  ];

  gtk = {
    enable = true;
    font.name = "RobotoMonoNerdFont";
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Nordzy";
      package = pkgs.nordzy-icon-theme;
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
    };
  };

  home.pointerCursor = {
    package = pkgs.nordzy-cursor-theme;
    name = "Nordzy-cursors";
    x11.enable = true;
    gtk.enable = true;
  };

  modules = {
    # Terminal
    alacritty = {
      enable = true;
      colorscheme = "nord";
      font = "roboto-mono";
      opacity = 1.0;
    };

    neovim = {
      enable = true;
      extraPlugins = with pkgs.vimPlugins; [
        bufferline-nvim
        lualine-nvim
        nvim-tree-lua
      ];
      extraPluginsConfiguration = ''
        require("bufferline").setup()
        require("lualine").setup()
        require("nvim-tree").setup()
        vim.keymap.set('n', "<leader>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
      '';
      theme = pkgs.vimPlugins.nightfox-nvim;
      themeConfiguration = ''
        require("nightfox").setup {
          palettes = {
            nordfox = {
              bg1 = "#232831"
            }
          }
        }
        vim.cmd.colorscheme "nordfox"
      '';
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g status-style 'bg=#2e3440 fg=#cdcecf'
      '';
    };

    # Desktop
    river = {
      enable = true;
      wallpaperCommand = "swaybg -i ~/pictures/wallpapers/early_snow_town.jpg";
      backgroundColor = "0x81a1c1";
      borderWidth = "3";
      focusedBorderColor = "0x81a1c1";
      unfocusedBorderColor = "0x767676";
      viewPadding = "8";
      outerPadding = "8";
    };

    rofi = {
      enable = true;
      theme = ./files/nord-rofi.rasi;
    };

    wallpapers = {
      enable = true;
    };

    waybar = {
      enable = true;
      barHeight = 30;
      theme = ./files/nord-waybar.css;
      wmModules = [ "river/tags" "river/window" ];
    };
  };
}
