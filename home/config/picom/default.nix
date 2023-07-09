{ pkgs, config, ... }:

{
    services.picom = {
        enable = true;
        vSync = true;
        backend = "glx";
    };
}
