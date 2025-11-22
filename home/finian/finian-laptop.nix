{ 
  config, 
  ... 
}: { 
  imports = [ 
    ./home.nix 
    ../common 
    ../features/cli
    ../features/games
    ../features/programming
  ];

  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
    };

    games = {
      minecraft.enable = true;
      archipelago.enable = true;
    };

    programming = {
      r.enable = true;
      gamedev.godot.enable = true;
    };

  };
}
