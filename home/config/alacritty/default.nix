{ pkgs, config, ... }:

{
    home.file = {
        ".config/alacritty/alacritty.yml".source = ./alacritty.yml;

        ".config/alacritty/colors" = {
            source = ./colors;
            recursive = true;
            executuble = false;
        };

        ".config/alacritty/fonts" = {
            source = ./fonts;
            recursive = true;
            executuble = false;
        };
    };
}
