{ pkgs, ... }:
{    
  programs.fish = {
    enable = true;
    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      ls = "eza";
      grep = "rg";
      ps = "procs";
    };
  };
}