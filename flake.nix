{
  description = "A personalized NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    #systems.url = "github:nix-systems/default-linux";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-neovim.url = "github:Shel-M/nix-neovim";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    firefox-addons,
    stylix,
    # nix-neovim,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
  in {
    inherit lib;

    overlays = import ./overlays {inherit inputs;};

	#    packages.x86_64-linux.neovim = (
	#      nvf.lib.neovimConfiguration {
	#        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	# modules = [ ./nvf/configuration.nix ];
	#    }).neovim;

    nixosConfigurations = {
      fw16 = let
        username = "shel";
        specialArgs = {inherit self username inputs firefox-addons outputs;};
      in lib.nixosSystem  {
        inherit specialArgs;
	modules = [
	  ./hosts/fw16
	  ./users/${username}/nixos.nix
	  # ./nvf/nixos.nix

	  stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = specialArgs;

            home-manager.users.${username} = {
	      imports = [
	        ./users/${username}/home.nix
	      ];
	    };
          }
	];
      };
    };
  };
}
