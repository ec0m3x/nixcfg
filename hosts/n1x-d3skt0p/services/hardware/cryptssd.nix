{ pkgs, ... }:

{
  boot.initrd.luks.devices."cryptssd" = {
    device = "/dev/disk/by-uuid/cd6257f8-3257-4426-8671-3c14874b1f7b";
    preLVM = true;
  };

  system.activationScripts = {
    setEncryptedPermissions = {
      deps = [];
      text = ''
        mkdir -p /mnt/encrypted-ssd
        chown root:users /mnt/encrypted-ssd
        chmod 775 /mnt/encrypted-ssd
      '';
    };
  };

  fileSystems."/mnt/encrypted-ssd" = {
    device = "/dev/mapper/cryptssd";
    fsType = "ext4";
    options = [ "noauto" "user" "rw" ];
  };

  systemd.services.mount-encrypted = {
    description = "Mount encrypted partition";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.util-linux}/bin/mount /mnt/encrypted-ssd";
      ExecStop = "${pkgs.util-linux}/bin/umount /mnt/encrypted-ssd";
    };
  };
}
