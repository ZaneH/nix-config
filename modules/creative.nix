{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kcolorchooser
    davinci-resolve-studio
    wayscriber
    krita
  ];
}
