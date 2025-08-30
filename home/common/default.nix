{
  config,
  lib, 
  outputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;
  nix.package = lib.mkDefault pkgs.nix;
  nix.settings.experimental-features = ["nix-command" "flakes";
};
