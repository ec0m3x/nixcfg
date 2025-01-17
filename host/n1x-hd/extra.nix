{
  imports = [
    ../common/services/extraServices
    ../common/services/backup
    
    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
    ../common/containers/baserow
    ../common/containers/n8n
  ];

  # Extra services
  extraServices.docker.enable = true;
  extraServices.ollama-gpu.enable = true;
  extraServices.cachix.enable = true;
  extraServices.gaming.enable = true;
  extraServices.nfs-mount.enable = true;
  extraServices.sunshine.enable = true;
  extraServices.vfio.enable = true;

  # WakeOnLan
  networking.interfaces.enp4s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };

  # Powermanagement
  powerManagement.powertop.enable = true;

}
