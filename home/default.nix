{ config, pkgs, ... }:

{
    imports = [
        ./templates
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };

    home = {
        username = "donny";
    };

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
        alacritty
        ani-cli
        brave
        brightnessctl
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
        mypy
        neofetch
        nsxiv
        playerctl
        ripgrep
        rofi
        starship
        streamlink
        sxhkd
        xfce.thunar
        tmux
        trash-cli
        unzip
        xdotool
        xdg-user-dirs
        xterm
        xwallpaper
        yewtube
        yt-dlp
        zip
    ];

    programs.home-manager.enable = true;
    home.stateVersion = "23.05";
}
