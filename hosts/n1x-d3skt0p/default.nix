{
  imports = [ 
    ../common
    ./configuration.nix
    ./services
    ./secrets.nix
  ];

  # Extra services
  extraServices.podman.enable = true;
  extraServices.gaming.enable = true;
  extraServices.ollama.enable = true;

}
