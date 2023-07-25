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
        plasmaSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./home
                    ./home/configs/desktop-environment.nix
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };

        qtileSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./home
                    ./home/configs/window-manager.nix
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };

        activateSession = {
            sessionModules = {
                qtile = ./modules/desktop-wm.nix;
                plasma5 = ./modules/desktop-de.nix;
            };

            qtile = with activateSession; [
                home-manager.nixosModules.home-manager qtileSession
                sessionModules.qtile
                nur.nixosModules.nur
            ];

            plasma = with activateSession; [
                home-manager.nixosModules.home-manager plasmaSession
                plasma
                nur.nixosModules.nur
            ];
        };
    in
    {
        nixosConfigurations = 
        let system = "x86_64-linux"; 
        specialArgs = { inherit inputs; };
        in {
            vm = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/vm.nix
                ] ++ activateSession.qtile;
            };

            potatopc = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/potato.nix
                ] ++ activateSession.plasma;
            };
        };
    };
}
