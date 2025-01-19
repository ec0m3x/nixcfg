{lib, ...}: {

  imports = [
    ./baserow.nix
    ./invokeai.nix
    ./n8n.nix
    ./ollama.nix
    ./openwebui.nix
    ./postgres.nix
    ./qdrant.nix
  ];

  system.activationScripts.createDockerNetworkDockerNet = lib.mkAfter ''
    if ! /run/current-system/sw/bin/docker network inspect dockernet >/dev/null 2>&1; then
      /run/current-system/sw/bin/docker network create dockernet
    fi
  '';
}