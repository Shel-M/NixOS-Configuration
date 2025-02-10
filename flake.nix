{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    inherit (self) outputs;
    systems = [ "x86_64-linux" ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    
    nixosConfigurations = {
      fw16 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	specialArgs = { inherit inputs outputs; };
        modules = [
          ./common/nixos/configuration.nix
          ./hosts/fw16/nixos/configuration.nix
       ];
      };
    };
  };
}
