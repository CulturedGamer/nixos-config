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

        poetry2nix = {
            url = "github:nix-community/poetry2nix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, home-manager, hyprland, poetry2nix }:
    let
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };

        defaultModules = [
            nur.nixosModules.nur
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager homeConfiguration
        ];

        homeConfiguration = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [ ./modules/home.nix ];
                _module.args.nur = { inherit nur; };
            };
            home-manager.extraSpecialArgs = { inherit poetry2nix; };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };
    in {
        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/laptop
                ] ++ defaultModules;
            };

            desktop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/desktop
                ] ++ defaultModules;
            };
        };
    };
}
