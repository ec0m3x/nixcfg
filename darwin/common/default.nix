{ pkgs, ... }:
{
  imports = [
    ./apps
    ./features
    ./services
    ./shell
  ];
}