{
    description = "My NixOS flake";
    
    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-unstable";
        };

        nur = {
            url = "github:nix-community/NUR";
        };

        dwm = {
            url = "github:CulturedGamer/dwm";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, dwm, home-manager, ... }:
    let
        system = "x86_64-linux"; 
        specialArgs = inputs;
        dwmSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./modules/home.nix
                    ./modules/environments/dwm-environment
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay inputs.dwm ];
        };

        plasmaSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./modules/home.nix
                    ./modules/environments/plasma-environment
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
                    ./modules/home.nix
                    ./modules/environments/qtile-environment
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };

        activateSession = {
            sessionSystemConfigurations = {
                qtile = ./modules/environments/qtile-environment/system.nix;
                plasma = ./modules/environments/plasma-environment/system.nix;
                dwm = ./modules/environments/dwm-environment/system.nix;
            };

            qtile = with activateSession; [
                home-manager.nixosModules.home-manager qtileSession
                sessionSystemConfigurations.qtile
                nur.nixosModules.nur
            ];

            plasma = with activateSession; [
                home-manager.nixosModules.home-manager plasmaSession
                sessionSystemConfigurations.plasma
                nur.nixosModules.nur
            ];

            dwm = with activateSession; [
                home-manager.nixosModules.home-manager dwmSession
                sessionSystemConfigurations.dwm
                nur.nixosModules.nur
            ];
        };
    in {
        nixosConfigurations = {
            vm = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/vm
                ] ++ activateSession.qtile;
            };

            potatopc = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/potato
                ] ++ activateSession.plasma;
            };

            laptop = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/laptop
                ] ++ activateSession.qtile;
            };
        };
    };
}
