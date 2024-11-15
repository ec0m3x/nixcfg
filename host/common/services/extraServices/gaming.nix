{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.gaming;
in {
  options.extraServices.gaming.enable = mkEnableOption "enable gaming";

  config = mkIf cfg.enable {
    programs = {
        steam = {
            enable = true;
            gamescopeSession.enable = true;
        };
        gamemode.enable = true;
    };

    environment.systemPackages = with pkgs; [
    protonup
    gamemode
    lutris
    prismlauncher
    ];

    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}