  { pkgs, lib, ... }: {

  boot = {
    
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


