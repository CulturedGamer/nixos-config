{ ... }:

{
  imports = [
    ../misc/bookmarks.nix
    ../misc/firefox.nix
    ../misc/wallpapers.nix
    ../misc/zathura.nix

    ../misc/scripts.nix

    ../terminal/bash.nix
    ../terminal/lf.nix
    ../terminal/starship.nix
    ../terminal/fish.nix
  ];

  modules = {
    bash.enable = true;
    firefox.enable = true;
    lf.enable = true;
    shell-scripts.enable = true;
    starship.enable = true;
    wallpapers.enable = true;
    zathura.enable = true;

    fish = {
      enable = true;
      enableShellAliases = true;
    };
  };
}
