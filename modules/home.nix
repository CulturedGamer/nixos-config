{ config, pkgs, ... }:

{
    imports = [
        ./graphic
        ./misc
        ./scripts
        ./templates
        ./terminal
        ./wallpapers
    ];

    home = {
        username = "donny";
        stateVersion = "23.05";
        packages = with pkgs; [
            ani-cli
            bluetuith
            brave
            brightnessctl
            cargo
            cava
            clang
            cmus
            fish
            flameshot
            fzf
            git-crypt
            gnumake
            htop
            imv
            lazygit
            mpv
            neofetch
            pavucontrol
            playerctl
            ripgrep
            rofi-wayland
            rustc
            starship
            streamlink
            sxhkd
            swaybg
            xfce.thunar
            trash-cli
            unzip
            xdotool
            xdg-user-dirs
            xterm
            xwallpaper
            wl-clipboard
            wtype
            yewtube
            yt-dlp
            zip

            # custom packages
            (callPackage ./pkgs/grapejuice.nix {})
        ];
    };

    programs.home-manager.enable = true;
}
