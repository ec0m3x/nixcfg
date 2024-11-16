{
  lib,
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
      # 1TB root/boot drive. Configured with:
      # - A FAT32 ESP partition for systemd-boot
      # - A LUKS container which containers multiple btrfs subvolumes for nixos install
      nvme0n1 = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              label = "boot";
              name = "ESP";
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                extraOpenArgs = [
                  "--allow-discards"
                  "--perf-no_read_workqueue"
                  "--perf-no_write_workqueue"
                ];
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
      sda = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data = {
              size = "100%";
              content = {
                type = "luks";
                name = "data";

                settings = {
                  # Make sure there is no trailing newline in keyfile if used for interactive unlock.
                  # Use `echo -n "password" > /tmp/secret.key`
                  keyFile = "/tmp/data.keyfile";
                  allowDiscards = true;
                };

                # Don't try to unlock this drive early in the boot.
                initrdUnlock = false;

                content = {
                  type = "btrfs";
                  # Override existing partition
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@data" = {
                      mountpoint = "/home/ecomex/data";
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
  };
}