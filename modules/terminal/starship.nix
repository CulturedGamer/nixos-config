{ config, lib, ... }:

with lib;

let
    cfg = config.modules.starship;
in {
    options.modules.starship.enable = mkEnableOption "Starship";
    config = mkIf cfg.enable {
        programs.starship = {
            enable = true;
            settings = {
                add_newline = false;
                line_break.disabled = true;
                cmd_duration.disabled = true;
            };
        };
    };
}
