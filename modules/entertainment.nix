{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    strawberry
    calibre
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-shaderfilter
    ];
  };
}
