{ config, pkgs, ... }:

{
    home.username = "donny";
    home.homeDirectory = "/home/donny";

    fonts.fontconfig.enable = true;

    home.file.".config/rofi" = {
        enable = true;
        source = ./rofi;
        recursive = true;
        executable = false;
    };

    home.packages = [
        alacritty
        brave
        brightnessctl
        cava
        clang
        cmus
        dejavu_fonts
        noto-fonts-emoji
        emacs
        firefox
        flameshot
        fzf
        gcc
        gnumake
        htop
        lxappearance
        mpv
        neofetch
        pass
        rofi
        starship
        syncthing
        xfce.thunar
        tmux
        trash-cli
        unzip
        xdotool
        xgd-user-dirs
        xterm
        xwallpaper
        zip
        
        # nerdfonts
        (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
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

    home.file.".config/alacritty/themes" = {
        enable = true;
        source = ./alacritty/themes/;
        recursive = true;
        executable = false;
    };
    
    programs.alacritty = {
        enable = true;
        settings = {
            env.TERM = xterm-256color;
            shell.program = fish;
            window.opacity = 1;
            font = {
                size = 12;
                normal.family = JetBrainsMonoNerdFont;
                bold.family = JetBrainsMonoNerdFont;
                italic.family = JetBrainsMonoNerdFont;
            };
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
