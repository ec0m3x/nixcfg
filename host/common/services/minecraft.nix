{ config, pkgs, unstable, ... }:

{
  services.minecraft-server = {
    enable = true;
    package = pkgs.unstable.minecraft-server;
    eula = true;
    declarative = true;
    serverProperties = {
      server-port = 25565;
      gamemode = "survival";
      motd = "3c0m3x Minecraft server on Tailscale!";
      max-players = 5;
      enable-rcon = true;
      "rcon.password" = "hunter2";
    };
  };
}