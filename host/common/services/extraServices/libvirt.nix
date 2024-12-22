{
  config,
  lib,
  pkgs,
  unstable,
  ...
}:
with lib; let
  cfg = config.extraServices.libvirt;
in {
  options.extraServices.libvirt.enable = mkEnableOption "enable virtualisation";

  config = mkIf cfg.enable {  
    environment.systemPackages = with pkgs; [ 
      virt-manager
    ];

    virtualisation.libvirtd = {
      allowedBridges = [
        "nm-bridge"
        "virbr0"
      ];
      enable = true;
      qemu.runAsRoot = false;
      qemu.ovmf.enable = true ;
      qemu.swtpm = {
        enable = true;
      };
    };
  };
}