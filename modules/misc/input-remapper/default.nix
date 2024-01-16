{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.input-remapper;
in
{
  options.modules.input-remapper.enable = mkEnableOption "Input Remapper";

  config = mkIf cfg.enable {
    home = {
      packages = [ pkgs.input-remapper ];
      file.".config/input-remapper-2" = {
        source = "./input-remapper-2";
        recursive = true;
      };
    };
  };
}
