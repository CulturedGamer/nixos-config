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
        sessionSettings = {
            desktopEnvironmentSettings = {
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
            windowManagerSettings = {
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

            sessionModules = {
                wm = ./modules/desktop-wm.nix;
                de = ./modules/desktop-de.nix;
            };
        };
    in
    {
        nixosConfigurations = 
        let system = "x86_64-linux"; 
        specialArgs = { inherit inputs; };
        defaultModules = [
            nur.nixosModules.nur
        ]; in {
            vm = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/vm.nix
                    home-manager.nixosModules.home-manager sessionSettings.windowManagerSettings
                    sessionSettings.sessionModules.wm
                ] ++ defaultModules;
            };
            potatopc = nixpkgs.lib.nixosSystem {
                inherit system specialArgs;
                modules = [
                    ./hosts/potato.nix
                    home-manager.nixosModules.home-manager sessionSettings.desktopEnvironmentSettings
                    sessionSettings.sessionModules.de
                ] ++ defaultModules;
            };
        };
    };
}
