{ config, pkgs, ... }:

{
    imports = [ ./custom ];

    programs.rofi.enable = true;
}
