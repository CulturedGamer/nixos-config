{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    users.users.donny = {
        isNormalUser = true;
        description = "donny";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # System packages
    environment.systemPackages = with pkgs; [
        curl
        gcc
        git
        gnumake
        htop
        neofetch
        neovim
        syncthing
        tmux
        unzip
        xterm
        wget
        zip
    ];
}
