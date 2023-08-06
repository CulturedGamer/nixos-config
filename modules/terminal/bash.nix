{ config, pkgs, ... }:

{
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
}
