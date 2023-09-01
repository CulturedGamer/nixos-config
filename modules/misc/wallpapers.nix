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
                rev = "afbcf179584a8fa3153c680e3fa830eb09492845";
                sha256 = "1ysqfzf5v6q0673xkqpr4zx9ngsd6xliddj9iwylj54vf5d7kwdk";
            };
            recursive = true;
        };
    };
}
