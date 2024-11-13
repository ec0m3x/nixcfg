{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.ecomex = {
    initialHashedPassword = "$y$j9T$DCsAZWNDXgusEdpMj5Kii.$ET9fwRimvENqxjcsYbLJt5cHsJPR1T1Eoq0lcqwJP1B";
    isNormalUser = true;
    description = "ecomex";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJR86g7+g3l7w1pLd40J/NcStNRNDIOnOXFYl775ySUQ ecomex@n1x-hd-1"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.ecomex =
    import ../../../home/ecomex/${config.networking.hostName}.nix;
}