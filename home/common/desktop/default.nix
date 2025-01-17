{ pkgs, desktop, inputs, ... }:

let
  system = "x86_64-linux";
in

{
  imports = [
    (./. + "/${desktop}")
    ../dev
    #./alacritty.nix
    #./gtk.nix
    #./qt.nix
  ];
  
  programs.firefox.enable = true;
  
  catppuccin.enable = false;

  fonts.fontconfig.enable = true;
}