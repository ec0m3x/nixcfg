{
  desktop,
  pkgs,
  self,
  ...
}: {
  imports = [
    (./. + "/${desktop}.nix")
    ../services/pipewire.nix
  ];

  hardware.graphics.enable = true;

  # Enable location services
  location.provider = "geoclue2";


  fonts = {
    packages = with pkgs; [
      liberation_ttf
      ubuntu_font_family
      theme.fonts.default.package
      theme.fonts.emoji.package
      theme.fonts.iconFont.package
      theme.fonts.monospace.package
    ];

    # Use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "${theme.fonts.default.name}"
          "${theme.fonts.emoji.name}"
        ];
        sansSerif = [
          "${theme.fonts.default.name}"
          "${theme.fonts.emoji.name}"
        ];
        monospace = [ "${theme.fonts.monospace.name}" ];
        emoji = [ "${theme.fonts.emoji.name}" ];
      };
    };
  };
}