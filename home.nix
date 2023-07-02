{ config, pkgs, ... }:

{
    home.username = "donny";
    home.homeDirectory = "/home/donny";

    programs.git = {
        enable = true;
    };

    home.packages = [
        alacritty
        brave
        brightnessctl
        cava
        clang
        cmus
        emacs
        firefox
        flameshot
        fzf
        lxappearance
        mpv
        pass
        rofi
        starship
        xfce.thunar
        trash-cli
        xgd-user-dirs
        xdotool
        xwallpaper
    ];

    programs.git = {
        enable = true;
        userName = "CulturedGamer";
        userEmail = "dony357@outlook.com";
    };

    programs.starship = {
        enable = true;
        settings = {
            add_newline = false;
            line_break.disabled = true;
            cmd_duration.disabled = true;
        };
    };

    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = xterm-256color;
            shell.program = fish;
            window.opacity = 1;
        };
    };
    
    programs.bash = {
        enable = true;
        settings = {
            
        };
    };

    programs.neovim = {
        defaultEditor = true;
        settings = {
              
        };
    };

    programs.home-manager.enable = true;
}
