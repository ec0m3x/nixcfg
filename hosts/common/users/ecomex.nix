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
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC+czDzPpVJu2fMR/fwRvOs/4fFmUrtIwW8/5+MJfG3APJAPo7KtSUK1MPcEBEL1hRN+uwIFW3XVMhu5xu5Y/l9ln9yl7HU5DSZnq2rMV1fd4qAAAxtBqyc8YwMHsEmseZt+ZkaDlsPkS37j8Lp3UvXhbfrra1XNWTudYSX1/Qtv0lxBu1yavsRlbz/N/0tYdWqrDbbrWdu4XAQT1Wkqk/xNvvNMKZjTK/e3vYIaQrb2QNnFRbh2Cxjk+mF0H+D2pjy/zubOTGMR5lFsiHyTCxwhVqpTqTC+2e/WnJmocRPZKkQWUhSP1V5pvNyvv5Vj09Yhw/4l1USsfoG4WFYMVXbS3Ms4KVJQc+IkUmB6i0gsfBYVDcAvA3TJ8H5K/bZC/lIB43uQRAe2KWa1Nfgjt7G+RkXuqTfXhMDNrQeLNg5+hTE2pzosAyJf2TLJveu5LPq+b2J+wgMu/3xDhN64fHJNg/b4XGpWF/2fFHLqvOkByyRxovsegg4DgzEz1kx8yddab7fXdrSlqy4u7HWRLA14I4s1KHsXbq3EpWkFaspVpYCKBpHhTSreLCq7PsHzheK2q6xHPB46ppa/ZCpitgSnbbpWWsMCAQmfc4qfuQg4gJuIvkMgeYhi4KXPntAeViDy8IbGHfQiBHrGL8EjnSd277ieLO4Ho7ppQ/TckKcRw== skoch@sks-concept.de"
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.ecomex =
    import ecomex/${config.networking.hostName}.nix;
}