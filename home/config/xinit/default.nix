{ config, pkgs, ... }:

{
    home.file.".xinitrc" = {
        text = ''
            #!/bin/sh

            exec sxhkd &
            exec picom --backend=glx &
            exec xset r rate 210 110
            qtile start
        '';
    }
}
