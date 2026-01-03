{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wayscriber
    chatterino7
  ];
}
