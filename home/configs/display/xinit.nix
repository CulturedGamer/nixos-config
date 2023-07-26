{ config, pkgs, ... }:

{
    home.file.".xinitrc" = {
        text = ''
            #!/bin/sh

            exec xwallpaper --zoom ~/Pictures/wallpapers/early_snow_town.jpg &
            exec sxhkd &
            exec xset r rate 210 110 &
            exec picom --backend=glx &
            qtile start
        '';
        executable = true;
    };
}
