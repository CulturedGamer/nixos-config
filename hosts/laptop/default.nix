{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../global.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  security.sudo.wheelNeedsPassword = false;

  hardware.bluetooth.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = [ pkgs.mesa.drivers ];
  };

  services.getty.autologinUser = "donny";
  services.upower.enable = true;

  # X11
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
}
