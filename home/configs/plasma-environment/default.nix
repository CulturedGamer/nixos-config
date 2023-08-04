{ config, pkgs, ... }:

{
    imports = [
        ./misc/firefox.nix

        ./terminal/alacritty
        ./terminal/neovim
        ./terminal/bash.nix
        ./terminal/fish.nix
        ./terminal/git.nix
        ./terminal/starship.nix
        ./terminal/tmux.nix
        ./terminal/lf.nix
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
