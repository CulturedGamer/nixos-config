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
            dwm = prev.dwm.overrideAttrs (_: {
                src = builtins.fetchGit {
                    url = "https://github.com/CulturedGamer/dwm";
                    rev = "38086b584b468b7c7083308359c2fb95be7a5683";
                    ref = "main";
                };
            });
        })
    ];

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        curl
        gcc
        git
        vim
        wget
	    xclip
    ];
}
