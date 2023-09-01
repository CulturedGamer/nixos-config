{ pkgs, ... }:

{
    imports = [
        ../desktop/hyprland.nix

        ../terminal/tmux.nix
        ../terminal/alacritty
        ../terminal/neovim

        ../graphic/waybar/default.nix

        ./global.nix
    ];

    gtk = {
        enable = true;
        font.name = "RobotoMonoNerdFont";
        theme = {
            name = "Qogir-Dark";
            package = pkgs.qogir-theme;
        };
        iconTheme = {
            name = "Qogir";
            package = pkgs.qogir-icon-theme;
        };
    };

    home.pointerCursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        x11.enable = true;
        gtk.enable = true;
    };

    modules = {
        # Terminal
        alacritty = {
            enable = true;
            colorscheme = "onedark";
            font = "hack";
        };

        neovim = {
            enable = true;
            theme = pkgs.vimPlugins.onedark-nvim;
            themeConfiguration = ''
                require("onedark").setup { style = "darker" }
                require("onedark").load()
            '';
        };

        tmux = {
            enable = true;
            plugins = with pkgs.tmuxPlugins; [ onedark-theme ];
        };
        
        # Graphical
        hyprland = {
            enable = true;
            activeBorderColor = "4fa6ed";
            wallpaperCommand = "swaybg -i ~/Pictures/wallpapers/onedark_clouds.png";
        };

        waybar = {
            enable = true;
            theme = ../graphic/waybar/styles/onedark.css;
        };
    };
}
