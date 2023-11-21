{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.rofi;
in
{
  options.modules.rofi = {
    enable = mkEnableOption "Rofi";

    theme = mkOption {
      type = types.path;
      description = "Rofi custom theme";
    };

    font = mkOption {
      type = types.str;
      default = "JetBrainsMonoNerdFont 10.5";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rofimoji
    ];

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      font = cfg.font;
      terminal = "${pkgs.alacritty}/bin/alacritty";
      theme = cfg.theme;
      extraConfig = {
        display-drun = "󰀻 ";
        display-run = " ";
        drun-display-format = "{icon} {name}";
        show-icons = true;
        icon-theme = "Qogir";
      };
    };
  };
}
