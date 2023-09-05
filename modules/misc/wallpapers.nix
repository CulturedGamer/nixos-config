{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.wallpapers;
in {
    options.modules.wallpapers.enable = mkEnableOption "Wallpapers directory";
    config = mkIf cfg.enable {
        home.file."Pictures/wallpapers" = {
            source = pkgs.fetchFromGitHub {
                owner = "veryfastman";
                repo = "wallpaper-collection";
                rev = "751845e9ecf0d230a99b72c42c9116f19ac492e4";
                sha256 = "15n3fn1bjj60z4d6gfzh3s25r6v1qhcrm69dxxb4a9mjf2kjglh7";
            };
            recursive = true;
        };
    };
}
