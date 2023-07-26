{ config, pkgs, ... }:

{
    home.file."Pictures/wallpapers" = {
        source = ./pictures;
        recursive = true;
    };
}
