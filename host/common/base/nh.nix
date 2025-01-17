{ pkgs, ... }:
{
  programs.nh = {
    enable = true;
    flake = "/home/ecomex/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep-since 5d --keep 3";
    };
  };
}