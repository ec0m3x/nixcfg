{
  config,
  lib,
  pkgs,
  unstable,
  ...
}:
with lib; let
  cfg = config.extraServices.ollama-gpu;
in {
  options.extraServices.ollama-gpu.enable = mkEnableOption "enable ollama with CUDA support";

  config = mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        host = "[::]";
        acceleration = "cuda";
        openFirewall = true;
      };
    };
    nixpkgs.config = {
        cudaSupport = config.services.xserver.videoDrivers == ["nvidia"];
    };
  };
}