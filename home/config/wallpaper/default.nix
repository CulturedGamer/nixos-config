{ config, pkgs, ... }:

{
    home.file."Pictures" = {
        source = ./pictures;
        recursive = true;
    };
}
