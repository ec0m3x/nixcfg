{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:
with lib; let
  cfg = config.features.desktop.stylix;
in {

  imports = with inputs; [
    stylix.homeManagerModules.stylix
  ];

  options.features.desktop.stylix.enable =
    mkEnableOption "enable stylix";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      google-fonts
    ];

    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      image = "${pkgs.wallpapers}/share/wallpapers/spill.jpg";



      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      fonts = {
        sizes = {
          terminal = 14;
          applications = 12;
          popups = 12;
        };

        serif = {
          name = "Source Serif";
          package = pkgs.source-serif;
        };

        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
