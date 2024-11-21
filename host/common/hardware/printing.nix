{ pkgs, ... }:
{
  services.printing = {
    enable = true;
  };
  environment.systemPackages = [ pkgs.cups-filters pkgs.hplip ];
}