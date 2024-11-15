{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.terminals.foot;
in {
  options.features.terminals.foot.enable = mkEnableOption "enable foot terminal emulator";

  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;

      settings = {
        main = {
          # term = "foot";
          shell = "fish";
          pad = "15x15";
          selection-target = "clipboard";
        };

        scrollback = {
          lines = 10000;
        };
      };
    };
  };
}
