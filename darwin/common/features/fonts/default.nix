{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.meslo-lg
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
      fira
      font-awesome
      liberation_ttf
      noto-fonts-emoji
      noto-fonts-monochrome-emoji
    ];
  };
}