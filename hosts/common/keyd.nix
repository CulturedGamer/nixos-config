{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.keyd
  ];

  environment.etc."keyd/default.conf".text = ''
    [ids]

    *

    [main]

    # Maps capslock to escape when pressed and control when held.
    capslock = overload(control, esc)

    # Remaps the escape key to capslock
    esc = capslock
  '';

  systemd.services = {
    # https://github.com/NixOS/nixpkgs/issues/59603#issuecomment-1356844284
    NetworkManager-wait-online.enable = false;

    keyd.enable = true;
  };
}
