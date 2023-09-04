{ pkgs, ... }:

let
    no-clown-fiesta-nvim = pkgs.vimUtils.buildVimPlugin {
        name = "no-clown-fiesta-nvim";
        src = pkgs.fetchFromGitHub {
            owner = "aktersnurra";
            repo = "no-clown-fiesta.nvim";
            rev = "778532e164aea273f6c8dab192b0fe918303871e";
            sha256 = "0p0cf8n927k7xzgxz77g73aj7dsj3axmzq4f8qj51c3ngq9kcy66";
        };
    };
in {
    imports = [
        ../desktop/river.nix

        ../misc/wallpapers.nix

        ../terminal/tmux.nix
        ../terminal/alacritty
        ../terminal/neovim

        ../graphic/rofi
        ../graphic/waybar/default.nix

        ./global.nix
    ];

    gtk = {
        enable = true;
        font.name = "Noto";
        theme = {
            name = "WhiteSur-Dark";
            package = pkgs.callPackage ../../pkgs/whitesur-gtk-theme.nix {
                colorVariants = [ "Dark" ];
            };
        };
        iconTheme = {
            name = "PaperIconTheme";
            package = pkgs.paper-icon-theme;
        };
    };

    modules = {
        # Terminal
        alacritty = {
            enable = true;
            colorscheme = "base16-default-dark";
            font = "jetbrains";
        };

        neovim = {
            enable = true;
            theme = no-clown-fiesta-nvim;
            themeConfiguration = ''
                vim.cmd.colorscheme "no-clown-fiesta"
            '';
        };

        tmux = {
            enable = true;
            extraConfig = ''
                set-window-option -g window-status-fg #d8d8d8
                set-window-option -g window-status-bg #181818
            '';
        };

        # Desktpo
        river = {
            enable = true;
            wallpaperCommand = "swaybg -i ~/Pictures/wallpapers/dark_city_morning.jpg";
        };

        rofi = {
            enable = true;
            theme = ../graphic/rofi/themes/minimal.rasi;
        };

        wallpapers = {
            enable = true;
        };

        waybar = {
            enable = true;
            theme = ../graphic/waybar/styles/minimal.css;
            wmModules = [ "river/tags" "river/window" ];
        };
    };
}
