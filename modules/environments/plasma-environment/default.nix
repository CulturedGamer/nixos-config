{ config, pkgs, ... }:

{
    imports = [
        ./custom
    ];

    home.packages = with pkgs; [
        alacritty
        ani-cli
        brave
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
        playerctl
        ripgrep
        rustc
        starship
        streamlink
        tmux
        trash-cli
        unzip
        xdg-user-dirs
        yewtube
        yt-dlp
        zip
    ];
}
