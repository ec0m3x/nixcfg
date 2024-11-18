{ config, pkgs, ... }:

{
  services.minecraft-server = {
    enable = true;
    eula = true; # set to true if you agree to Mojang's EULA: https://account.mojang.com/documents/minecraft_eula
    declarative = true;

    # see here for more info: https://minecraft.gamepedia.com/Server.properties#server.properties
    serverProperties = {
      server-port = 25565;
      gamemode = "survival";
      motd = "3c0m3x Minecraft server on Tailscale!";
      max-players = 5;
    };
  };
}