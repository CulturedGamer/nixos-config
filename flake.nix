{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/nur";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neorg-overlay = {
      url = "github:nvim-neorg/nixpkgs-neorg-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    alacritty-files = {
      url = "github:veryfastman/alacritty-configuration-files";
      flake = false;
    };

    shell-scripts = {
      url = "github:veryfastman/shell-scripts";
      flake = false;
    };

    wallpaper-collection = {
      url = "github:veryfastman/wallpaper-collection";
      flake = false;
    };
  };

  outputs =
    inputs@{ self
    , nixpkgs
    , nur
    , home-manager
    , neorg-overlay
    , alacritty-files
    , basic-templates
    , shell-scripts
    , wallpaper-collection
    }:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      extraModules = [ nur.nixosModules.nur ];

      homeManagerConfiguration = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.donny = {
          imports = [ ./home.nix ];
          _module.args.nur = { inherit nur; };
        };
        home-manager.extraSpecialArgs = { inherit inputs; };
        nixpkgs.overlays = [
          neorg-overlay.overlays.default
          nur.overlay
        ];
      };
    in
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./hosts/laptop
            home-manager.nixosModules.home-manager
            homeManagerConfiguration
          ] ++ extraModules;
        };

        desktop = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./hosts/desktop
            home-manager.nixosModules.home-manager
            homeManagerConfiguration
          ] ++ extraModules;
        };
      };

      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
    };
}
