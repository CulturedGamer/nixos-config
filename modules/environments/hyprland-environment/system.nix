{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    users.users.donny.packages = [
        pkgs.rofi-wayland
        pkgs.wl-clipboard
        pkgs.wtype
    ];
}
