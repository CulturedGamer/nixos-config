{
	description = "My NixOS flake";

	inputs = {
		nixpkgs = {
			url = "github:nixos/nixpkgs/nixos-unstable";
		};

		nur = {
			url = "github:nix-community/nur";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nur, home-manager, hyprland }:
	let
		system = "x86_64-linux";
		specialArgs = { inherit inputs; };
	in {
		nixosConfigurations = {
			laptop = nixpkgs.lib.nixosSystem {
				inherit system specialArgs;
				modules = [
					./hosts/laptop
					nur.nixosModules.nur
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.donny = {
							imports = [ ./modules/devices/laptop/home.nix ];
							_module.args.nur = { inherit nur; };
						};
						nixpkgs.overlays = [ inputs.nur.overlay ];
					}
				];
			};
			desktop = nixpkgs.lib.nixosSystem {
				inherit system specialArgs;
				modules = [
					./hosts/desktop
					nur.nixosModules.nur
					hyprland.homeManagerModules.default
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.donny = {
							imports = [ ./modules/devices/desktop/home.nix ];
							_module.args.nur = { inherit nur; };
						};
						nixpkgs.overlays = [ inputs.nur.overlay ];
					}
				];
			};
		};
	};
}
