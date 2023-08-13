{ config, pkgs, ... }:

{
    home.file = {
        ".config/alacritty/colors" = {
            source = ./colors;
            recursive = true;
        };

        ".config/alacritty/fonts" = {
            source = ./fonts;
            recursive = true;
        };
    };

    programs.alacritty = {
        enable = true;
        settings = {
            import = [
                "/home/donny/.config/alacritty/colors/catppuccin-mocha.yml"
                "/home/donny/.config/alacritty/fonts/jetbrains.yml"
            ];
            env.TERM = "xterm-256color";
            shell.program = "fish";
        };
    };
}
