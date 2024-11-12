{pkgs, ...}: {
  imports = [
    ./blueman.nix
    ./fonts.nix
    ./hyprland.nix
    ./hypridle.nix
    ./nextcloud-client.nix
    ./stylix.nix
    ./wayland.nix
  ];
}
