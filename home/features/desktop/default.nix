{pkgs, ...}: {
  imports = [
    ./hyprland
    ./blueman.nix
    ./fonts.nix
    ./nextcloud-client.nix
    ./stylix.nix
    ./wayland.nix
  ];
}
