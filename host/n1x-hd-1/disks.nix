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
  environment.etc = {
    "crypttab".text = ''
      data1  /dev/disk/by-partlabel/data1  /etc/data.keyfile
      data2  /dev/disk/by-partlabel/data2  /etc/data.keyfile
    '';
  };

  disko.devices = {
    disk = {
      # 1TB root/boot drive. Configured with:
      # - A FAT32 ESP partition for systemd-boot
      # - A LUKS container which containers multiple btrfs subvolumes for nixos install
      nvme0n1 = {
        type = "disk";
        device = builtins.elemAt disks 0;
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
        device = builtins.elemAt disks 1;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data1 = {
              size = "100%";
              label = "data1";
              content = {
                type = "luks";
                name = "data1";
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
                      mountpoint = "/home/ecomex/data/data-ssd-1";
                      mountOptions = defaultBtrfsOpts;
                    };
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
            data2 = {
              size = "100%";
              label = "data1";
              content = {
                type = "luks";
                name = "data2";
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
                      mountpoint = "/home/ecomex/data/data-ssd-2";
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