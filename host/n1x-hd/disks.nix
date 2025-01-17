{
  lib,
  disks ? [
    "/dev/nvme0n1"
    "/dev/sda"
    "/dev/sdb"
    "/dev/sdc"
  ],
  ... 
}:
let
  cryptroot = "cryptroot";
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
      data-ssd1  /dev/disk/by-partlabel/data-ssd1  /etc/data1.keyfile
      data-ssd2  /dev/disk/by-partlabel/data-ssd2  /etc/data2.keyfile
    '';
  };

  disko.devices = {
    disk = {
      # 1TB nvme root/boot drive. Configured with:
      # - A FAT32 ESP partition for systemd-boot
      # - Multiple btrfs subvolumes for the installation of nixos
      nvme0 = {
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
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "${cryptroot}";

                settings = {
                  allowDiscards = true;
                };

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
              label = "data-ssd1";
              content = {
                type = "luks";
                name = "data-ssd1";
                settings = {
                  # Make sure there is no trailing newline in keyfile if used for interactive unlock.
                  # Use `echo -n "password" > /tmp/secret.key`
                  keyFile = "/tmp/data1.keyfile";
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
                      mountpoint = "/mnt/cryptdata1";
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
              label = "data-ssd2";
              content = {
                type = "luks";
                name = "data-ssd2";
                settings = {
                  # Make sure there is no trailing newline in keyfile if used for interactive unlock.
                  # Use `echo -n "password" > /tmp/secret.key`
                  keyFile = "/tmp/data2.keyfile";
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
                      mountpoint = "/mnt/cryptdata2";
                      mountOptions = defaultBtrfsOpts;
                    };
                  };
                };
              };
            };
          };
        };
      };
      sdc = {
        device = builtins.elemAt disks 3;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            data-hdd = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/mnt/data-hdd";
              };
            };
          };
        };
      };
    };
  };
}