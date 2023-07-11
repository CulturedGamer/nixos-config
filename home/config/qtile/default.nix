{ config, pkgs, ... }:

{
    home.file.".config/qtile/config.py".source = ./config.py;        
    home.file.".config/qtile/autostart.sh" = {
        text = ''
            sxhkd &
            xset r rate 210 110
        '';
        executable = true;
    };
}
