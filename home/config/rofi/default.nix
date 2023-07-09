{ pkgs, config, ... }:

{
    home.file = {
        ".config/rofi/config.rasi".source = ./config.rasi;

        ".config/rofi/applets" = {
            source = ./applets;
            recursive = true;
        };

        ".config/rofi/colors" = {
            source = ./colors;
            recursive = true;
        };

        ".config/rofi/images" = {
            source = ./images;
            recursive = true;
        };

        ".config/rofi/launchers" = {
            source = ./launchers;
            recursive = true;
        };

        ".config/rofi/powermenu" = {
            source = ./powermenu;
            recursive = true;
        };

        ".config/rofi/scripts" = {
            source = ./scripts;
            recursive = true;
            executable = true;
        };
    };   
}
