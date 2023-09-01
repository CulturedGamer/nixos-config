{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.rofi;
in {
    options.modules.rofi = {
        enable = mkEnableOption "Rofi";

        theme = mkOption {
            type = types.path;
            default = ./themes/onedark.rasi;
            description = "Rofi custom theme";
        };
    };

    config = mkIf cfg.enable {
        programs.rofi = {
            enable = true;
            package = pkgs.rofi-wayland;
            font = "HackNerdFont 11.5";
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
