{ pkgs, ... }:

{
    imports = [
        ./modules/themes/onedark.nix
    ];

    programs.home-manager.enable = true;

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
            cinnamon.nemo
            cmus
            fish
            fzf
            git-crypt
            gnumake
            htop
            imv
            lazygit
            mpv-unwrapped
            neofetch
            pavucontrol
            playerctl
            ripgrep
            rofimoji
            rustc
            starship
            streamlink
            sxhkd
            swaybg
            trash-cli
            texlive.combined.scheme-full
            unzip
            xdotool
            xdg-user-dirs
            xwallpaper
            wl-clipboard
            wtype
            yewtube
            yt-dlp
            zip
        ];
    };

    nixpkgs.overlays = [
        (final: prev: {
            mpv-unwrapped = prev.mpv-unwrapped.override {
                scripts = [ prev.mpvScripts.mpris ];
                ffmpeg_6 = pkgs.ffmpeg_6-full;
            };
        })
    ];
}
