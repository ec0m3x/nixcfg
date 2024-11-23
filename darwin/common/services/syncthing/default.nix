{ ... }: {
  services.syncthing = {
    enable = true;
    dataDir = "/home/${username}";
    openDefaultPorts = true;
    configDir = "/home/${username}/.config/syncthing";
    user = "${username}";
    group = "users";
    guiAddress = "0.0.0.0:8384";
  };
}