{ config, pkgs, ... }:

{
    imports = [
        ./display/gtk.nix
        ./display/xinit.nix

        ./misc/sxhkd.nix

        ./terminal/alacritty
        ./terminal/tmux.nix
        ./terminal/neovim.nix
    ];

    home.packages = with pkgs; [
        alacritty
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
        node
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
