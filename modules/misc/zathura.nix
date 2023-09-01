{ config, lib, ... }:

with lib;

let
    cfg = config.modules.zathura;
in {
    options.modules.zathura = { 
        enable = mkEnableOption "zathura";
    };

    config = mkIf cfg.enable {
        programs.zathura = {
            enable = true;
            options = {
                default-bg = "#1f2329";
                default-fg = "#a0a8b7";
            };
        };
    };
}
