{ config,
  lib,
  pkgs,
  ...
}: {

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
    hardware.graphics = {
  	enable = true;
  	enable32Bit = true;
	  extraPackages = with pkgs; [
	    vaapiVdpau
  	  libvdpau
  	  libvdpau-va-gl 
  	  nvidia-vaapi-driver
  	  vdpauinfo
	    libva
 		  libva-utils		
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.finegrained = false;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  hardware.nvidia-container-toolkit.enable = true;
}
