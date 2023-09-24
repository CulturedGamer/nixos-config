{ pkgs, ... }:

let
  no-clown-fiesta-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "no-clown-fiesta-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "aktersnurra";
      repo = "no-clown-fiesta.nvim";
      rev = "778532e164aea273f6c8dab192b0fe918303871e";
      sha256 = "0p0cf8n927k7xzgxz77g73aj7dsj3axmzq4f8qj51c3ngq9kcy66";
    };
  };
in
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
    font.name = "Noto";
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.callPackage ../../pkgs/whitesur-gtk-theme.nix {
        colorVariants = [ "Dark" ];
      };
    };
    iconTheme = {
      name = "PaperIconTheme";
      package = pkgs.paper-icon-theme;
    };
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
      theme = no-clown-fiesta-nvim;
      themeConfiguration = ''
        vim.cmd.colorscheme "no-clown-fiesta"
      '';
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g status-style 'bg=#181818 fg=#d8d8d8'
      '';
    };

    # Desktop
    river = {
      enable = true;
      wallpaperCommand = "swaybg -i ~/pictures/wallpapers/ripple_wallpaper.png";
      backgroundColor = "0x181818";
      borderWidth = "1";
      focusedBorderColor = "0x7E97AB";
      unfocusedBorderColor = "0x626262";
    };

    rofi = {
      enable = true;
      theme = ./files/minimal-rofi.css;
    };

    wallpapers = {
      enable = true;
    };

    waybar = {
      enable = true;
      theme = ./files/minimal-waybar.css;
      wmModules = [ "river/tags" "river/window" ];
      barPosition = "top";
    };
  };
}
