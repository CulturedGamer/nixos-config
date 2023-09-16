{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.modules.shell-scripts;
in
{
  options.modules.shell-scripts.enable = mkEnableOption "My shell scripts";
  config = mkIf cfg.enable {
    home.file.".local/bin" = {
      source = inputs.shell-scripts;
      recursive = true;
      executable = true;
    };
  };
}
