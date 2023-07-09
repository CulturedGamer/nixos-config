{ pkgs, config, ... }:

{
    home.file.".config/sxhkd/sxhkdrc" = {
        source = ./sxhkdrc;
        executable = true;
    };
}
