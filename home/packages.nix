{ config, pkgs, ... }:
# TODO: add more packages if needed
{
    home.packages = with pkgs; [
        alacritty
        ani-cli
        brave
        brightnessctl
        cava
        clang
        cmus
        firefox
        fish
        flameshot
        fzf
        gcc
        gnumake
        htop
        mpv
        neofetch
        nsxiv
        pass
        rofi
        starship
        streamlink
        xfce.thunar
        tmux
        trash-cli
        unzip
        xdotool
        xgd-user-dirs
        xterm
        xwallpaper
        yewtube
        yt-dlp
        zip
    ];
}
