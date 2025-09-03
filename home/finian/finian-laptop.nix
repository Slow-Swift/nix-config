{ 
  config, 
  ... 
}: { 
  imports = [ 
    ./home.nix 
    ../common 
    ../features/cli
    ../features/games
  ];

  features = {
    cli = {
      fish.enable = true;
    };

    games = {
      minecraft.enable = true;
    };
  };
}
