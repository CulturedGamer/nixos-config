{ pkgs, ... }:

{
    home.packages = with pkgs; [
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
        lazygit
        mpv
        neofetch
        nsxiv
        pavucontrol
        playerctl
        ripgrep
        rofi-wayland
        rustc
        starship
        streamlink
        sxhkd
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
    ];
}
