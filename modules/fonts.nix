{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.blex-mono
    nerd-fonts.jetbrains-mono
  ];
}
