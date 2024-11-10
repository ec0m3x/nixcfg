{ pkgs, config, ... }: { imports = [ 
  ../common
  ./home.nix
  ./dotfiles
  ../features/cli
  ../features/desktop
  ];


  features = {
    cli = {
      fish.enable = true;
      fzf.enable = true;
      neofetch.enable = true;
    };
    desktop = {
      hyprland.enable = true;
      wayland.enable = true;
      fonts.enable = true;
    };
  };

  home.packages = with pkgs; [
  vscode
  brave
  ];

  wayland.windowManager.hyprland = {
    settings = {
      device = [
        {
          name = "keyboard";
          kb_layout = "de";
        }
        {
          name = "mouse";
          sensitivity = -0.5;
        }
      ];
      monitor = [
        "HDMI-A-3,3440x1440@100,0x0,1"

      ];
      workspace = [
        "1, monitor:HDMI-A-3, default:true"
        "2, monitor:HDMI-A-3"
        "3, monitor:HDMI-A-3"
        "4, monitor:HDMI-A-3"
        "5, monitor:HDMI-A-3"
        "6, monitor:HDMI-A-3"
        "7, monitor:HDMI-A-3"
      ];
    };
  };
}
