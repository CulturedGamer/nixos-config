{ ... }:

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
                "/home/donny/.config/alacritty/colors/onedark.yml"
                "/home/donny/.config/alacritty/fonts/cascadia-code.yml"
            ];
            env.TERM = "xterm-256color";
            shell.program = "fish";
        };
    };
}
