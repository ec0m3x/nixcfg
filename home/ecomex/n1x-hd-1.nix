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
    terminals = {
      foot.enable = true;
    };
    desktop = {
      hyprland.enable = true;
      hypridle.enable = true;
      wayland.enable = true;
      fonts.enable = true;
      blueman.enable = true;
      nextcloud-client.enable = false;
      stylix.enable = true;
    };
  };

  home.packages = with pkgs; [
  vscode
  zotero
  obsidian
  thunderbird
  vlc
  yt-dlp
  obs-studio
  spotify
  musikcube
  vesktop
  bitwarden-desktop
  skanlite
  brave
  cava
  ];

  wayland.windowManager.hyprland = {
    enable = true;
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
        "HDMI-A-1,3440x1440@100,0x0,1"
      ];
      workspace = [
        "1, persistent:true"
        "2, persistent:true"
        "3, persistent:true"
        "4, persistent:true"
        "5, persistent:true"
        "6, persistent:true"
        "7, persistent:true"
      ];
    };
  };
}
