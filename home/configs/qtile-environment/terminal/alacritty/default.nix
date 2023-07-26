{ config, pkgs, ... }:

{
    home.file = {
        ".config/alacritty/alacritty.yml".source = ./alacritty.yml;

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
