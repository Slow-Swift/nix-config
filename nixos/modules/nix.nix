{ inputs, user, pkgs, ... }:
{
  meta = {};

  imports = [];

  options = {};

  config.environment.systemPackages = with pkgs; [
    nixfmt
  ];

  config.nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
      persistent = true;
    };

    # Recommended configuration for nixd
    # https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
    # https://youtu.be/M_zMoHlbZBY?si=GdjiJ4WitumJV8Eu&t=185
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    optimise = {
      automatic = true;
      dates = ["weekly"];
      persistent = true;
    };

    settings = {
      # This saves space by hardlinking files with the same contents to a single file.
      # This may have downsides for writing to the store.
      auto-optimise-store = true;

      experimental-features = ["nix-command" "flakes"];

      trusted-users = ["root" user];
    };
  };
}
