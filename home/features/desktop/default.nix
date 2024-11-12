{pkgs, ...}: {
  imports = [
    ./blueman.nix
    ./fonts.nix
    ./hyprland.nix
    ./nextcloud-client.nix
    ./stylix.nix
    ./wayland.nix
  ];
}
