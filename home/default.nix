{ config, pkgs, ... }:

{
    imports = [
        ./configs
        ./templates
    ];

    home.file.".local/bin" = {
        source = ./scripts;
        recursive = true;
        executable = true;
    };
}
