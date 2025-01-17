{
  pkgs,
  lib,
  self,
  ...
}:
{
  services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      
  };
  services = {
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "ecomex";
    displayManager.defaultSession = "gnome";
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
