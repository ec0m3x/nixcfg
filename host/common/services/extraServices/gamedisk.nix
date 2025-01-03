{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.gamedisk;
in {
  options.extraServices.gamedisk.enable = mkEnableOption "enable gamedisk";

  config = mkIf cfg.enable {
    fileSystems."/home/ecomex/gamedisk" = {
      device = "/dev/disk/by-label/Games"; # UUID der Partition
      fsType = "ntfs-3g"; # NTFS mit ntfs-3g
      options = [ 
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "x-systemd.device-timeout=5s"
        "x-systemd.mount-timeout=5s"
      ];
    };
    systemd.mounts = [
      {
        what = "/dev/disk/by-label/Games"; # UUID der Partition
        where = "/home/ecomex/gamedisk";           # Ziel-Mountpunkt
        type = "ntfs-3g";                    # NTFS mit ntfs-3g
        options = "defaults,nofail,uid=1000,gid=1000,umask=022"; # Optionen
        wantedBy = [ "multi-user.target" ];
      }
    ];
  };
}