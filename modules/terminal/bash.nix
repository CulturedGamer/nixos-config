{ config, lib, ... }:

with lib;

let
    cfg = config.modules.bash;
in {
    options.modules.bash.enable = mkEnableOption "Bash";

    config = mkIf cfg.enable {
        programs.bash = {
            enable = true;
            enableCompletion = true;

            bashrcExtra = ''
                export PATH="$PATH:$HOME/.local/bin" 
            '';

            shellAliases = {
                ls = "ls --color";
                grep = "grep --color=auto";
                v = "nvim";
                re = "sudo reboot";
                pow = "sudo poweroff";
            };
        };
    };
}
