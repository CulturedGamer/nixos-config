{ config, lib, ... }:

with lib;
let
    cfg = config.modules.shell-scripts;
in {
    options.modules.shell-scripts.enable = mkEnableOption "shell-scripts";
    config = mkIf cfg.enable {
        home.file.".local/bin" = {
            source = ./.;
            recursive = true;
            executable = true;
        };
    };
}
