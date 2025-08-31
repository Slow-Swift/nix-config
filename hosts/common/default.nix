{
  pkgs,
  lib,
  inputs,
  outputs,
  ...
}: {
  imports = [ 
    ./users
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  nixpkgs.config.allowUnfree = true;

  nix = let 
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
	"finian"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;
      
    # I think this adds the flake to the global registry
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = ["/etc/nix/path"] ++ lib.mapAttrsToList (flakeName: _: "${flakeName}=flake:${flakeName}") flakeInputs;
  };
}
