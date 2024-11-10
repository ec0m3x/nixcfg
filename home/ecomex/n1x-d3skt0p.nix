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
      blueman.enable = true;
      nextcloud-client.enable = false;
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
    };
  };
}
