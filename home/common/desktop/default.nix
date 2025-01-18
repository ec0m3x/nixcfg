{ pkgs, desktop, inputs, ... }:

let
  system = "x86_64-linux";
in

{
  imports = [
    (./. + "/${desktop}")
    ./vscode.nix
    ./alacritty.nix
  ];
  
  programs.firefox.enable = true;

  catppuccin.enable = false;

  fonts.fontconfig.enable = true;
}