{ config, pkgs, ... }:

{
    home.file.".config/sxhkd/sxhkdrc" = {
        source = ./sxhkdrc;
        executable = true;
    };
}
