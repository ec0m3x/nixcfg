{ pkgs, desktop, ... }:
{
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true;
        KernelExperimental = true;
      };
    };
  };
}