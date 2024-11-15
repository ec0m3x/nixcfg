{
  imports = [ 
    ../common
    ./cachix
    ./configuration.nix
    ./localservices
    ./secrets.nix
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = true;
  extraServices.ollama.enable = true;
  extraServices.libvirt.enable = true;

}
