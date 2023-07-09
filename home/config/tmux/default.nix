{ pkgs, config, ... }:

{
    home.file.".tmux.conf".source = ./tmux.conf;
}
