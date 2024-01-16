{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common
    # ../common/keyd.nix
    ../common/vm.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = [ pkgs.mesa.drivers ];
  };

  services.upower.enable = true;
}
