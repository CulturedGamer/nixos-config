{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
    };
    home.file."mozilla/firefox/13i9foj13.betterfox" = {
        source = ./modified-betterfox;
        recursive = true;
    };
}
