{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    strawberry
  ];
}
