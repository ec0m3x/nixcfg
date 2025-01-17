  { pkgs, lib, ... }: {

  boot = {
    initrd = {
      availableKernelModules = [ 
        "ata_piix"
        "uhci_hcd"
        "virtio_pci"
        "virtio_blk" 
      ];
    };
    kernelModules = [
      "kvm-amd"
    ];
  };
}


