{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wayscriber
    chatterino7
    weylus
    scrcpy
  ];
}
