{ pkgs, ... }:
{
  imports = [
    ./homebrew.nix
    ./fix-aliases.nix
  ];
}