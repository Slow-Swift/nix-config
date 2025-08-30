{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "x85_64-linux"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    
    nixosConfigurations = {
      finian-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
	modules = [ ./hosts/finian-laptop ];
      };
    };

    homeConfigurations = {
      finian = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
	extraSpecialArgs = { inherit inputs outputs; };
	modules = [ ./home/finian/finian.nix ];
      };
    };
  };
}
