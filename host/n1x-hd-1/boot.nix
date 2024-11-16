  { pkgs, lib, ... }: {

  boot = {
    initrd.systemd.enable = true;
    
    # Secure boot configuration
    bootspec.enable = true;
    loader.systemd-boot.enable = lib.mkForce false;
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    
    initrd = {
      availableKernelModules = [ 
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod" 
      ];
    };
    kernelModules = [
      "kvm-amd"
    ];
    
    # Use the latest Linux kernel, rather than the default LTS
    kernelPackages = pkgs.linuxPackages_latest;
  };
}


