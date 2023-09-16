{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/keyd.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # enable dolphin emulator
  services.udev.packages = [ pkgs.dolphinEmu ];
  boot.extraModulePackages = [ config.boot.kernelPackages.gcadapter-oc-kmod ];
  boot.kernelModules = [ "gcadapter_oc" ];
}
