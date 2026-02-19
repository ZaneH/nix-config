{ pkgs, ... }:

{
  home.packages = with pkgs; [
    haruna
    strawberry
    libebur128
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
