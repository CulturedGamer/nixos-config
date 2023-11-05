{ pkgs, ... }:

{
  imports = [
    ./modules/themes/gruvbox
    # ./modules/themes/minimal
    # ./modules/themes/nord
    # ./modules/themes/onedark
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
      rofimoji
      rustc
      starship
      streamlink
      sxhkd
      swaybg
      trash-cli
      texlive.combined.scheme-full
      unzip
      xdotool
      xdg-user-dirs
      xwallpaper
      wine-wayland
      wl-clipboard
      wtype
      yewtube
      yt-dlp
      zip

      (pkgs.wrapMpv
        (pkgs.mpv-unwrapped.override {
          ffmpeg_5 = pkgs.ffmpeg_6-full;
        })
        { scripts = [ pkgs.mpvScripts.mpris ]; })
    ];
  };
}
