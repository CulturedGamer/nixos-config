{ config, pkgs, ... }:

{
    imports = [
        ./custom
    ];

    home.packages = with pkgs; [
        ani-cli
        brave
        brightnessctl
        cargo
        cava
        clang
        cmus
        dmenu
        fish
        flameshot
        fzf
        git-crypt
        gnumake
        htop
        lazygit
        mpv
        mypy
        neofetch
        nodejs_20
        nsxiv
        playerctl
        ripgrep
        rofi
        rustc
        slstatus
        starship
        streamlink
        sxhkd
        xfce.thunar
        tmux
        trash-cli
        tree-sitter
        unzip
        xdotool
        xdg-user-dirs
        xterm
        xwallpaper
        yewtube
        yt-dlp
        zip
    ];
}
