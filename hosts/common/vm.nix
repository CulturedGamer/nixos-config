{ ... }:

{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.donny.extraGroups = [ "libvirtd" ];
}
