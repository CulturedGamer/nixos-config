{ pkgs, ... }:

{
  imports = [
    ../../desktop/hyprland.nix

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
      name = "Qogir-Dark";
      package = pkgs.qogir-theme;
    };
    iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };
  };

  home = {
      pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        x11.enable = true;
        gtk.enable = true;
      };

      packages = with pkgs; [
        grim
        slurp
        wl-clipboard
        wtype
      ];
  };

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

    # Desktop
    hyprland = {
      enable = true;
      enableAnimations = true;
      roundBorders = true;
      activeBorderColor = "4fa6ed";
      wallpaperCommand = "swaybg -i ~/Pictures/wallpapers/onedark_clouds.png";
    };

    rofi = {
      enable = true;
      theme = ./files/onedark-rofi.rasi;
    };

    waybar = {
      enable = true;
      barHeight = 30;
      theme = ./files/onedark-waybar.css;
      wmModules = [ "hyprland/workspaces" "hyprland/window" ];
    };
  };
}
