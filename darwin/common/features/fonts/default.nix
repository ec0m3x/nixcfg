{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "NerdFontsSymbolsOnly"
          "JetBrainsMono"
        ];
      })
      fira
      font-awesome
      liberation_ttf
      noto-fonts-emoji
      noto-fonts-monochrome-emoji
    ];
  };
}