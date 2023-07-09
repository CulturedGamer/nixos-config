{ pkgs, config, ... }:

{
    services.xserver.windowManager.qtile.enable = true;
    home.file.".config/qtile/config.py".source = ./config.py;        
}
