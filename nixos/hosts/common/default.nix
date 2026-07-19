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

  users.defaultUserShell = pkgs.fish;
}
