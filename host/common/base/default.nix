{
  hostname,
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
    ./boot.nix
    ./hardware.nix
    ./locale.nix
    ./nh.nix
    ./zramswap.nix

    ../services/avahi.nix
    ../services/firewall.nix
    ../services/tailscale.nix
    ../services/openssh.nix
  ];

  environment.systemPackages = (import ./packages.nix { inherit pkgs; }).basePackages;

  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
  };

  programs.zsh.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
  services.rpcbind.enable = true;
  
  # Create dirs for home-manager
  systemd.tmpfiles.rules = [ "d /nix/var/nix/profiles/per-user/${username} 0755 ${username} root" ];
}