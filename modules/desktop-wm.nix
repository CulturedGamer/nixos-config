{ config, pkgs, ... }:

{
    # import home-manager configs
    imports = [
        ./display/wallpaper
        ./display/gtk.nix
        ./display/picom.nix
        ./display/qtile.nix
        ./display/xinit.nix

        ./terminal/alacritty
        ./terminal/neovim
        ./terminal/bash.nix
        ./terminal/fish.nix
        ./terminal/git.nix
        ./terminal/starship.nix
        ./terminal/tmux.nix
        ./terminal/lf.nix

        ./misc/rofi
        ./misc/bookmarks.nix
        ./misc/firefox.nix
        ./misc/sxhkd.nix
    ];

    fonts = {
        fonts = with pkgs; [
            material-design-icons
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "Hack" "Iosevka" "JetBrainsMono"  "RobotoMono" ]; })
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
    services.xserver.displayManager.startx.enable = true;
    services.xserver.windowManager.qtile.enable = true;
    services.xserver = {
        layout = "us";
        xkbVariant = "";
    };

    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
        curl
        gcc
        git
        neovim
        wget
	    xclip
    ];
}
