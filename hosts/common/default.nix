{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  security.polkit.enable = true;

  time.timeZone = "America/Los_Angeles";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.donny = {
    isNormalUser = true;
    extraGroups = [ "keyd" "networkmanager" "wheel" ];
    home = "/home/donny";
  };

  environment.systemPackages = with pkgs; [
    curl
    gcc
    git
    neovim
    nix-prefetch-git
    pulseaudio
    python3
    rsync
    tree
    vimv
    wget
  ];

  fonts = {
    packages = with pkgs; [
      material-design-icons
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [
          "BigBlueTerminal"
          "CascadiaCode"
          "DroidSansMono"
          "Gohu"
          "FiraCode"
          "Hack"
          "Inconsolata"
          "Iosevka"
          "JetBrainsMono"
          "Meslo"
          "RobotoMono"
        ];
      })
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.dconf.enable = true;

  services.printing.enable = true;
  services.udisks2.enable = true;

  sound.mediaKeys.enable = true;

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";
}
