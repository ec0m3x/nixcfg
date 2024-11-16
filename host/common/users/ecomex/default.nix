{ pkgs, config, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.ecomex = {
    isNormalUser = true;
    initialHashedPassword = "$y$j9T$DCsAZWNDXgusEdpMj5Kii.$ET9fwRimvENqxjcsYbLJt5cHsJPR1T1Eoq0lcqwJP1B";
    shell = pkgs.fish;
    extraGroups =
      [
        "audio"
        "networkmanager"
        "users"
        "video"
        "wheel"
      ]
      ++ ifExists [
        "docker"
        "plugdev"
        "render"
        "lxd"
        "kvm"
        "libvirt"
      ];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqiPSANwQ8T9MTUTRZLX9ug0K5fRGwOYbnI0bMZ7gjC ecomex@n1x-hd-1"
    ];

    packages = [ pkgs.home-manager ];
  };

  # This is a workaround for not seemingly being able to set $EDITOR in home-manager
  environment.sessionVariables = {
    EDITOR = "nano";
  };
}
