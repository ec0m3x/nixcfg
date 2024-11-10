{
  imports = [ 
    ../common
    ./configuration.nix
    ./services
    ./secrets.nix
  ];

  # Extra services
  extraServices.podman.enable = false;
  extraServices.gaming.enable = true;

}
