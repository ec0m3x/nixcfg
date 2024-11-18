{
  config,
  lib,
  pkgs,
  username,
  hostname,
  ...
}:
with lib; let
  cfg = config.extraServices.syncthing;
in {
  options.extraServices.syncthing.enable = mkEnableOption "enable syncthing";

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      dataDir = "/home/${username}";
      openDefaultPorts = true;
      configDir = "/home/${username}/.config/syncthing";
      user = "${username}";
      group = "users";
      guiAddress = "0.0.0.0:8384";
    };
  };
}