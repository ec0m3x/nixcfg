{
  lib,
  disks ? [
    "/dev/nvme0n1"
    "/dev/sda"
    "/dev/sdb"
  ],
  ... 
}:
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
      nvme = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
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
      sda = {
        device = builtins.elemAt disks 1;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              label = "data";
              content = {
                type = "btrfs";
                # Override existing partition
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@data" = {
                    mountpoint = "/mnt/data";
                    mountOptions = defaultBtrfsOpts;
                  };
                };
              };
            };
          };
        };
      };
      sdb = {
        device = builtins.elemAt disks 2;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ai = {
              size = "100%";
              label = "ai-disk";
              content = {
                type = "btrfs";
                # Override existing partition
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@ai" = {
                    mountpoint = "/mnt/ai-disk";
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
