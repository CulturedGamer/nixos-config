{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.wallpapers;
in {
    options.modules.wallpapers.enable = mkEnableOption "Wallpapers directory";
    config = mkIf cfg.enable {
        home.file."Pictures/wallpapers" = {
            src = pkgs.fetchFromGitHub {
                
            };
            recursive = true;
        };
    };
}
