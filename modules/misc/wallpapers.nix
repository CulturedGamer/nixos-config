{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.wallpapers;
in
{
  options.modules.wallpapers.enable = mkEnableOption "Wallpaper directory";
  config = mkIf cfg.enable {
    home.file."Pictures/wallpapers" = {
      source = inputs.wallpaper-collection;
      recursive = true;
    };
  };
}
