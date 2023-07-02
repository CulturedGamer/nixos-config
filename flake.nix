{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github.com/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github.com:NixOS/nixpkgs/nixos-unstable";  
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: {
            nixosConfigurations = {
                "nixos" = nixpkgs.lib.nixosSystem {
                    system = "x86_64-linux";
                    modules = [
                        ./configuration.nix
                    ];
                };
            };
        };
    }
