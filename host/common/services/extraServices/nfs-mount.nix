{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.extraServices.nfs-mount;
in {
  options.extraServices.nfs-mount.enable = mkEnableOption "enable nfs-mount";

  config = mkIf cfg.enable {

    # Mount the NFS share
    fileSystems."/home/ecomex/nfs" = {
      device = "10.20.50.40:/data";
      fsType = "nfs";
      options = [ 
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "x-systemd.device-timeout=5s"
        "x-systemd.mount-timeout=5s"
      ];
    };

    # Ensure network is up before mounting
    systemd.mounts = [
      {
        where = "/home/ecomex/nfs";
        what = "10.20.50.40:/data";
        requires = [ "network-online.target" ];
        after = [ "network-online.target" ];
      }
    ];

    # Enable rpcbind which is required for NFS
    services.rpcbind.enable = true;
  };
}