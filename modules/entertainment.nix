{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    strawberry
  ];
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-shaderfilter
    ];
  };
}
