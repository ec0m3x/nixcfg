{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.cockpit;
in {
  options.extraServices.cockpit.enable = mkEnableOption "enable cockpitt";

  config = mkIf cfg.enable {
    services = {
      cockpit = {
        enable = true;
        port = 9595;
        openFirewall = true;
        settings = {
          WebService = {
          AllowUnencrypted = true;
          };
        };
      };
    };
  };
}