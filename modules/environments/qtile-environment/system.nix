{ config, pkgs, ... }:

{
    services.xserver.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.displayManager.startx.enable = true;
    services.xserver.windowManager.qtile.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    users.users.donny.packages = [
        pkgs.rofi
        pkgs.kitty
    ];
}
