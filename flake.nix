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

    outputs = { self, nixpkgs, nur, home-manager, ... }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                    nur.nixosModules.nur
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
