{ lib, ... }:
let
  defaultBtrfsOpts = [
    "defaults"
    "compress=zstd:1"
    "ssd"
    "noatime"
    "nodiratime"
  ];
in
{

  disko.devices = {
    disk = {
      # 512GB root/boot drive. Configured with:
      # - A FAT32 ESP partition for systemd-boot
      # - Multiple btrfs subvolumes for the installation of nixos
      nvme0 = {
        device = "/dev/vda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              start = "0%";
              end = "512MiB";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              start = "512MiB";
              end = "100%";
              content = {
                type = "btrfs";
                # Override existing partition
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                    mountOptions = defaultBtrfsOpts;
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = defaultBtrfsOpts;
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = defaultBtrfsOpts;
                  };
                  "@var" = {
                    mountpoint = "/var";
                    mountOptions = defaultBtrfsOpts;
                  };
                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                    mountOptions = defaultBtrfsOpts;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
