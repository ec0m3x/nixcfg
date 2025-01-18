{
  imports = [
    ../common/services/extraServices
    ../common/services/backup
    ../common/dev
    
    # Containers
    ../common/containers/openwebui
    ../common/containers/invokeai
    ../common/containers/baserow
    ../common/containers/n8n
    ../common/containers/ollama
  ];

  # Extra services
  extraServices.docker.enable = true;
  extraServices.cachix.enable = true;
  extraServices.gaming.enable = true;
  extraServices.nfs-mount.enable = true;
  extraServices.vfio.enable = true;

  # WakeOnLan
  networking.interfaces.enp4s0.wakeOnLan = {
    enable = true;
    policy = [ "magic" ];
  };

  networking = {
    firewall = {
      allowedTCPPorts = [
      ];
      allowedUDPPorts = [
      ];
    };
  };
}
