{
  pkgs,
  self,
  config,
  ...
}: {

  imports = with inputs; [
    stylix.homeManagerModules.stylix
  ];

    home.packages = with pkgs; [
      google-fonts
      wallpapers
    ];

    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
      image = "${pkgs.wallpapers}/share/wallpapers/windows-error.jpg";

      cursor = {
        name = "Bibata-Modern-Classic";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      fonts = {
        sizes = {
          terminal = 12;
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
    gtk = {
      enable = true;
      iconTheme = {
        name = "kora";
        package = pkgs.kora-icon-theme;
      };
    };
  };
}