{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.blueman;
in {
  options.features.desktop.blueman.enable =
    mkEnableOption "enable blueman bluetooth manager";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
        blueman
        ];
    services =  {
        blueman-applet.enable = true;
    };
  };
}