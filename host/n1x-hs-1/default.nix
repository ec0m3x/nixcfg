{
  imports = [ 
    ../common
    ./configuration.nix
    ./localservices
  ];

  # Extra services
  extraServices.podman.enable = true;
}
