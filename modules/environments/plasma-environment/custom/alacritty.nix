{ config, pkgs, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            import = [
                "/home/donny/.config/alacritty/colors/base16-ayu-dark.yml"
                "/home/donny/.config/alacritty/fonts/hack.yml"
            ];
            env.TERM = "xterm-256color";
            shell.program = "fish";
            window.opacity = 1;
        };
    };
}
