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
    # Use the latest Linux kernel, rather than the default LTS
    #kernelPackages = pkgs.linuxPackages_latest;
}


