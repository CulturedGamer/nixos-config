{ config, pkgs, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            import = [
                "/home/donny/.config/alacritty/colors/vscode.yml"
                "/home/donny/.config/alacritty/fonts/firacode.yml"
            ];
            env.TERM = "xterm-256color";
            shell.program = "fish";
            window.opacity = 1;
        };
    };
}
