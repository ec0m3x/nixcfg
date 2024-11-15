{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware.nix
    ./locale.nix
    ./nh.nix

    ../services/tailscale.nix
    ../services/openssh.nix
  ];

  environment.systemPackages = (import ./packages.nix { inherit pkgs; }).basePackages;

  programs.fish.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

}