{
  pkgs,
  ...
}: {
  imports = [
    ./minecraft.nix
    ./archipelago.nix
  ];
}
