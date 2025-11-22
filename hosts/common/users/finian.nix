{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.finian = {
    isNormalUser = true;
    description = "Finian";
    extraGroups = [
      "wheel"
      "networkmanager"
      "kvm"
      "adbusers"
    ];

    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };

  # TODO: Replace hostName with configuration variable
  home-manager.users.finian = import ../../../home/finian/${config.networking.hostName}.nix;
}
