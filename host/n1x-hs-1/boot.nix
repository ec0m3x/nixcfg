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
        "virtio_pci"
        "sr_mod"
        "virtio_blk" 
      ];
    };
    kernelModules = [
      "kvm-intel"
    ];
  
  kernel.sysctl = lib.mkForce { "vm.overcommit_memory" = 1; };
  };
}


