{ config, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;

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

    services.xserver.videoDrivers = [ "intel" ];
    services.xserver.deviceSection = ''
        Option "DRI" "2"
        Option "TearFree" "true"
    '';

    # enable dolphin emulator
    services.udev.packages = [ pkgs.dolphinEmu ];
    boot.extraModulePackages = [ config.boot.kernelPackages.gcadapter-oc-kmod ];
    boot.kernelModules = [ "gcadapter_oc" ];

    users.users.donny = {
        isNormalUser = true;
        description = "donny";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    environment.systemPackages = with pkgs; [
        curl
        dolphinEmu
        gcc
        git
        neovim
        tree
        vimv
        wget
        wl-clipboard
        xclip
    ];

    fonts = {
        packages = with pkgs; [
            material-design-icons
            noto-fonts
            noto-fonts-cjk
            noto-fonts-emoji
            (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" "Hack" "Iosevka" "JetBrainsMono" "RobotoMono" ]; })
        ];

        enableDefaultPackages = false;

        fontconfig.defaultFonts = {
            serif = [ "Noto Serif" "Noto Color Emoji" ];
            sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
            monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
            emoji = [ "Noto Color Emoji" ];
        };
    };

    services.printing.enable = true;

    programs.dconf.enable = true;

    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "23.11";
}
