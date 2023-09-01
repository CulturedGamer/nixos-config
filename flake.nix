{
    description = "My NixOS flake";
    
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/nur";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland = {
            url = "github:hyprwm/hyprland";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, home-manager, hyprland }:
    let
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        extraModules = [
            nur.nixosModules.nur
            hyprland.nixosModules.default
        ];
        
        homeManagerConfiguration = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [ ./home.nix ];
                modules.hyprland.enable = true;
                _module.args.nur = { inherit nur; };
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
            nixpkgs.overlays = [ nur.overlay ];
        };
    in {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/laptop
                    home-manager.nixosModules.home-manager homeManagerConfiguration
                ] ++ extraModules;
            };

            desktop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/desktop
                    home-manager.nixosModules.home-manager homeManagerConfiguration
                ] ++ extraModules;
            };

        };
    };
}
