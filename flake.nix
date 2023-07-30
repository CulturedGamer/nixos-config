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
            url = "github:CulturedGamer/dwm-config";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-23.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ self, nixpkgs, nur, dwm, home-manager, ... }:
    let
        dwmSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./home
                    ./home/configs/dwm-environment
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };

        plasmaSession = {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.donny = {
                imports = [
                    ./home
                    ./home/configs/plasma-environment
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
                    ./home/configs/qtile-environment
                ];
                _module.args.nur = { inherit nur; };
            };
            nixpkgs.overlays = [ inputs.nur.overlay ];
        };

        activateSession = {
            sessionSystemConfigurations = {
                qtile = ./modules/qtile-system.nix;
                plasma = ./modules/plasma-system.nix;
                dwm = ./modules/dwm-system.nix;
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
    in
    {
        overlays = [
            (_: prev: { inherit (dwm.pakages.${prev.system}) dwm; })
        ];

        nixosConfigurations = 
        let 
            system = "x86_64-linux"; 
            specialArgs = { inherit inputs; };
        in {
            vm = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/vm
                ] ++ activateSession.dwm;
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
