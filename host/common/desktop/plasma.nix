{
  pkgs,
  ...
}:
{
  services.xserver.enable = false; # optional
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings = {
      Autologin = {
        Session = "plasma.desktop";
        User = "ecomex";
      };
    };
  };
  services.desktopManager.plasma6.enable = true;
}
