{ inputs, lib, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    (import ./disks.nix { inherit lib; })
  ];

  virtualisation.hypervGuest.enable = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}