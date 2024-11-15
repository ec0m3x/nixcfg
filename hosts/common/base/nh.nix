{ pkgs, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/ecomex/Projects/nixcfg";
    clean = {
      enable = true;
      extraArgs = "--keep-since 10d --keep 3";
    };
  };
}