{ ... }: {
  services.syncthing = {
    enable = true;
    dataDir = "/Users/${username}";
    openDefaultPorts = true;
    configDir = "/Users/${username}/.config/syncthing";
    user = "${username}";
    group = "users";
    guiAddress = "0.0.0.0:8384";
  };
}