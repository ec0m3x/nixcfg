{ pkgs, config, ... }: { imports = [ 
  ../common
  ./home-server.nix
  ../features/cli
  ];


  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
  };

  home.packages = with pkgs; [
    
  ];
}
