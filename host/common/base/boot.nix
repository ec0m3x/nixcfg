{
  pkgs,
  hostname,
  ...
}:
{
  boot = {
    initrd.systemd.enable = true;

    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;
    };

    loader = if hostname == "n1x-cs-1" || hostname == "n1x-hs-2"
    then {
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        useOSProber = true;
      };
    } else {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };
    
    supportedFilesystems = [ "nfs" ];
  };
}