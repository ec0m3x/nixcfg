{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.sunshine;
in {
  options.extraServices.sunshine.enable = mkEnableOption "enable sunshine";

  config = mkIf cfg.enable {
    services = {
      sunshine = {
        enable = true;
        autoStart = true;
        openFirewall = true;
        capSysAdmin = true;
      };
    };
  };
}
