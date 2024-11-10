{pkgs, ...}: {
  imports = [
    ./blueman.nix
    ./fonts.nix
    ./hyprland.nix
    ./nextcloud-client.nix
    ./wayland.nix
  ];
}
