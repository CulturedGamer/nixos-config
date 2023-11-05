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
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
    };
  };

  home.pointerCursor = {
    package = pkgs.capitaine-cursors-themed;
    name = "Capitaine Cursors (Gruvbox)";
    x11.enable = true;
    gtk.enable = true;
  };

  modules = {
    # Terminal
    alacritty = {
      enable = true;
      colorscheme = "gruvbox";
      font = "inconsolata";
      opacity = 1.0;
    };

    neovim = {
      enable = true;
      theme = pkgs.vimPlugins.gruvbox-material;
      themeConfiguration = ''
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_foreground = "material"
        vim.g.gruvbox_material_better_performance = 1
        vim.cmd.colorscheme "gruvbox-material"
      '';
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g status-style 'bg=#282828 fg=#fbf1c7'
      '';
    };

    # Desktop
    river = {
      enable = true;
      wallpaperCommand = "swaybg -i ~/Pictures/wallpapers/gruvy_seaside.jpg";
      backgroundColor = "0x282828";
      borderWidth = "2";
      focusedBorderColor = "0x458588";
      unfocusedBorderColor = "0x282828";
      viewPadding = "4";
      outerPadding = "4";
    };

    rofi = {
      enable = true;
      theme = ./files/gruvbox-rofi.rasi;
    };

    wallpapers = {
      enable = true;
    };

    waybar = {
      enable = true;
      barHeight = 30;
      theme = ./files/gruvbox-waybar.css;
      wmModules = [ "river/tags" "river/window" ];
    };
  };
}
