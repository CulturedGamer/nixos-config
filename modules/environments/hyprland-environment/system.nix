{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.displayManager.sddm.enable = true;
    programs.hyprland.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    users.users.donny.packages = [
        pkgs.rofi-wayland
        pkgs.wtype
    ];
}
