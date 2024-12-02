{ pkgs, ... }:
{
  imports = [
    ./homebrew.nix
  ];
  environment.systemPackages = with pkgs; [
    brave
    discord
    zotero
    spotify
  ];
}