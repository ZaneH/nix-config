{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haruna
    strawberry
    calibre
    yt-dlp
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-shaderfilter
    ];
  };
}
