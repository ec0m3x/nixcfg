{
  pkgs,
  lib,
  self,
  ...
}:
{
  services.xserver = {
      enable = true;
      
      # Using gdm and gnome
      # lightdm failed to start with autologin, probably linked to X auth and Gnome service conflict
      # X auth was not ready when Gnome session started, can be seen with journalctl _UID=$(id -u sunshine) -b
      # Maybe another combination of displayManager / desktopManager works
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
