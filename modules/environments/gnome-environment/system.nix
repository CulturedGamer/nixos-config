{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    users.users.donny.packages = [ pkgs.gnome.gnome-tweaks ];

    hardware.pulseaudio.enable = false;
}
