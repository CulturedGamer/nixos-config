{ config, pkgs, ... }:

{
    fonts = {
        fonts = with pkgs; [
            material-design-icons
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "Hack" "Iosevka" "JetBrainsMono" "RobotoMono" ]; })
        ];

        enableDefaultFonts = false;

        fontconfig.defaultFonts = {
            serif = [ "Noto Serif" "Noto Color Emoji" ];
            sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
            monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };

    services.xserver.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.displayManager.startx.enable = true;
    services.xserver.windowManager.dwm.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    nixpkgs.overlays = [
        (final: prev: {
            dwm = prev.dwm.overrideAttrs (old: { src = ~/Suckless_builds/dwm ;});
        })
    ];

    environment.systemPackages = with pkgs; [
        curl
        gcc
        git
        neovim
        wget
	    xclip
    ];
}
