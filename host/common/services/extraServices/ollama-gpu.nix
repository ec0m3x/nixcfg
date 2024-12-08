{
  config,
  lib,
  pkgs,
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
  };
}