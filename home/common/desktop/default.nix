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

  home.packages = with pkgs; [
    audacity
    vscode
    zotero
    thunderbird
    yt-dlp
    obs-studio
    davinci-resolve
    spotify
    musikcube
    vesktop
    bitwarden-desktop
    skanlite
    brave
    # bambu-studio
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
    todoist-electron
    xdg-utils
    xorg.xlsclients
    inputs.zen-browser.packages."${system}".specific
  ];

  fonts.fontconfig.enable = true;
}