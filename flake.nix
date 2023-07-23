{
    description = "My NixOS flake";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nur.url = "github:nix-community/NUR";
        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, home-manager, ... }:
    let
        homeManagerSettings = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./modules/home-manager.nix
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };
    in
    {
        nixosConfigurations = let system = "x86_64-linux"; specialArgs = { inherit inputs; }; in {
            vm = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./modules/vm.nix
                    home-manager.nixosModules.home-manager homeManagerSettings
                    nur.nixosModules.nur
                ];
            };

            potatopc = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./modules/potato.nix
                    home-manager.nixosModules.home-manager homeManagerSettings
                    nur.nixosModules.nur
                ];
            };
        };
    };
}
