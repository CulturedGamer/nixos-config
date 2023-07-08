{ pkgs, config, ... }:

{
    home.file = {
        ".config/rofi/config.rasi".source = ./config.rasi;

        "./config/rofi/applets" = {
            source = ./applets;
            recursive = true;
            executable = false;
        };

        "./config/rofi/colors" = {
            source = ./colors;
            recursive = true;
            executable = false;
        };

        "./config/rofi/images" = {
            source = ./images;
            recursive = true;
            executable = false;
        };

        "./config/rofi/launchers" = {
            source = ./launchers;
            recursive = true;
            executable = false;
        };

        "./config/rofi/powermenu" = {
            source = ./powermenu;
            recursive = true;
            executable = false;
        };

        "./config/rofi/scripts" = {
            source = ./scripts;
            recursive = true;
            executable = true;
        };
    };   
}
