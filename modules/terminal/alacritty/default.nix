{ config, pkgs, ... }:

{
    home.file = {
        ".config/alacritty/colors" = {
            source = ./colors;
            recursive = true;
        };

        ".config/alacritty/fonts" = {
            source = ./fonts;
            recursive = true;
        };
    };
}
