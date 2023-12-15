{ ... }: {
  home.file."~/Pictures/wlogout_icons" = {
    recursive = true;
    source = ./.;
  };
}
