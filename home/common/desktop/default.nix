{ pkgs, desktop, inputs, ... }:

let
  system = "x86_64-linux";
in

{
  imports = [
    (./. + "/${desktop}")

    ../dev

    ./foot.nix
    ./alacritty.nix
    ./gtk.nix
    ./qt.nix
    ./xdg.nix
  ];

  programs = {
    firefox.enable = true;
    mpv.enable = true;
  };
  
  catppuccin.enable = true;

  home.packages = with pkgs; [
    audacity
    vscode
    conda
    zotero
    thunderbird
    yt-dlp
    obs-studio
    ffmpeg
    spotify
    musikcube
    vesktop
    bitwarden-desktop
    libreoffice-fresh
    catppuccin-gtk
    desktop-file-utils
    (google-chrome.override {
      commandLineArgs = [
        # Workaround for log spam on video calls: https://issues.chromium.org/issues/331796411
        "--disable-gpu-memory-buffer-video-frames"
        "--ozone-platform-hint=auto"
      ];
    })
    libnotify
    loupe
    obsidian
    pamixer
    papers
    pavucontrol
    unstable.rambox
    signal-desktop
    telegram-desktop
    todoist-electron
    xdg-utils
    xorg.xlsclients
    inputs.zen-browser.packages."${system}".default
  ];

  fonts.fontconfig.enable = true;
}