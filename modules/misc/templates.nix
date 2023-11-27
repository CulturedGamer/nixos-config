{ config, lib, inputs, ... }:

with lib;

let
  cfg = config.modules.templates;
in
{
  options.modules.templates.enable = mkEnableOption "Programming templates";
  config = mkIf cfg.enable {
    home.file."Templates/programming" = {
      source = inputs.basic-templates;
      recursive = true;
    };
  };
}