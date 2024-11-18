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
  
  kernel.sysctl = lib.mkForce { "vm.overcommit_memory" = 1; };
  };
}


