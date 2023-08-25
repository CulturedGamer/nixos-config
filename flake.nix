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

        defaultNixosModules = [
            nur.nixosModules.nur
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager homeConfiguration
        ];

        homeConfiguration = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [ ./home ];
                _module.args.nur = { inherit nur; };
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };
    in {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/laptop
                ] ++ defaultNixosModules;
            };

            desktop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/desktop
                ] ++ defaultNixosModules;
            };
        };
    };
}
