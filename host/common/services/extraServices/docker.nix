{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.extraServices.docker;
in {
  options.extraServices.docker.enable = mkEnableOption "enable docker";

  config = mkIf cfg.enable {
    virtualisation = {
      docker = {
        enable = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
          flags = [
            "--filter=until=24h"
            "--filter=label!=important"
          ];
        };
        enableOnBoot = true;
      };
      oci-containers.backend = "docker";
    };
    environment.systemPackages = [
      inputs.compose2nix.packages.x86_64-linux.default
    ];
  };
}
