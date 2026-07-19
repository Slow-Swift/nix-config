{
  description = "NixOS configuration for my home machine";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-26.05";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    self,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;

    username = "finian";
    user = "finian";
    host = "finian-laptop";
  in {
    nixosConfigurations."finian-laptop" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs user username; };
      modules = [ 
        ./nixos/hosts/finian-laptop 
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ./home-manager/users/${user}/default.nix;
          home-manager.extraSpecialArgs = { inherit inputs outputs user username; };
        }
      ];
    };

    homeConfigurations."${user}@finian-laptop" = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs outputs username host; };
      modules = [ ./home-manager/users/${user}/default.nix ];
    };
  };
}
