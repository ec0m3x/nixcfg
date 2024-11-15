{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.ollama;
in {
  options.extraServices.ollama.enable = mkEnableOption "enable ollama";

  config = mkIf cfg.enable {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}