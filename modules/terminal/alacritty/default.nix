{ config, lib, ... }:

with lib;

let
    cfg = config.modules.alacritty;
in {
    options.modules.alacritty = {
        enable = mkEnableOption "Alacritty";

        colorscheme = mkOption {
            type = types.str;
            description = "Sets a colorscheme";
        };

        font = mkOption {
            type = types.enum [ "bigblue" "cascadia-code" "droid-sans-mono" "firacode" "gohu" "hack" "inconsolata"
                "iosevka" "jetbrains" "liberation-mono" "meslo" "roboto-mono" "ubuntu-mono" "victor-mono" ];
            description = "Sets a font";
        };

    };

    config = mkIf cfg.enable {
        programs.alacritty = {
            enable = true;
            settings = {
                import = [
                    ./colors/${cfg.colorscheme}.yml
                    ./fonts/${cfg.font}.yml
                ];
                env.TERM = "xterm-256color";
                shell.program = "fish";
                window.opacity = 0.8;
                key_bindings = [
                    {
                        key = "N";
                        mods = "Control|Shift";
                        action = "SpawnNewInstance";
                    }
                ];
            };
        };
    };
}
