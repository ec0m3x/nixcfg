  { pkgs, lib, ... }: {

  boot = {
    initrd = {
      availableKernelModules = [ 
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "uas"
        "sd_mod" 
      ];
    };
    kernelModules = [
      "kvm-intel"
    ];
  
    kernelPackages = pkgs.linuxPackages_latest;
  };
}


