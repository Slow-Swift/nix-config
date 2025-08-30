{
  lib,
  inputs,
  outputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
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
    registry = 
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);

    nixPath = ["/etc/nix/path"];
  };
}
