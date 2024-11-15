  { pkgs, lib, ... }: {

  boot = {
    initrd = {
      availableKernelModules = [ 
        "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" 
      ];
    };
    kernelModules = [
      "kvm-amd"
    ];
  };
}


