{ pkgs, ... }:

{
  imports = [
    # ./modules/themes/gruvbox
    # ./modules/themes/minimal
    # ./modules/themes/nord
    # ./modules/themes/onedark
    ./modules/themes/plasma
  ];

  programs.home-manager.enable = true;

  home = {
    username = "donny";
    stateVersion = "23.05";
    packages = with pkgs; [
      ani-cli
      bluetuith
      brave
      brightnessctl
      cargo
      cava
      cinnamon.nemo
      cmus
      fish
      fzf
      gimp
      git-crypt
      gnumake
      htop
      imv
      lazygit
      neofetch
      pavucontrol
      playerctl
      ripgrep
      rustc
      starship
      streamlink
      swaybg
      trash-cli
      texlive.combined.scheme-full
      unzip
      xdg-user-dirs
      yewtube
      yt-dlp
      zip

      (pkgs.wrapMpv
        (pkgs.mpv-unwrapped.override {
          ffmpeg = pkgs.ffmpeg_6-full;
        })
        { scripts = [ pkgs.mpvScripts.mpris ]; })
    ];
  };
}
