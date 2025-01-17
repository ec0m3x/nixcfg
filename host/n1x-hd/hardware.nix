{ inputs, lib, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko
    (import ./disks.nix { inherit lib; })

    ../common/hardware/nvidia.nix
    ../common/hardware/xbox-controller.nix
    ../common/hardware/bluetooth.nix

  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}