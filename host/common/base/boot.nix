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

    loader = if hostname == "n1x-cs-1" or "n1x-hd-1" 
    then {
      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    } else {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    supportedFilesystems = [ "nfs" ];
  };
}