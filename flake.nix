{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github.com/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github.com:NixOS/nixpkgs/nixos-unstable";  
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, ... }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.donny = import ./home;
                    }
                ];
            };
        };
    };
}
