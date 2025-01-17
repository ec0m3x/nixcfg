{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.cachix;
in {
  options.extraServices.cachix.enable = mkEnableOption "enable cachix binary cache";

  config = mkIf cfg.enable {
    nix.settings = {
      substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };
}