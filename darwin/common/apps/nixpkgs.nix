{ pkgs, ... }:{
    
  environment.systemPackages = with pkgs; [
    alacritty
    brave
    discord
    zotero
    spotify
    yt-dlp
    ffmpeg
    telegram-desktop
  ];
}