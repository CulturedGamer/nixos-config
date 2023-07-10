{ config, pkgs, ... }:

{
    home.file."~/Templates/c_template" = {
        source = ./c_template;
        recursive = true;
    };

    home.file."~/Templates/cpp_template" = {
        source = ./cpp_template;
        recursive = true;
    };

    home.file."~/Templates/opengl_template" = {
        source = ./opengl_template;
        recursive = true;
    };
}
