{ config, pkgs, ... }:

{
    # import home-manager configs
    imports = [
        ../home/configs/misc/firefox.nix
        ../home/configs/terminal/alacritty
        ../home/configs/terminal/neovim
        ../home/configs/terminal/bash.nix
        ../home/configs/terminal/fish.nix
        ../home/configs/terminal/git.nix
        ../home/configs/terminal/starship.nix
        ../home/configs/terminal/tmux.nix
        ../home/configs/terminal/lf.nix
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
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
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
