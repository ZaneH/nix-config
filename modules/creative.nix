{ pkgs, lib, ... }:
let
  isX86Linux = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
in
{
  home.packages = with pkgs; [
    kdePackages.kcolorchooser
    krita
    inkscape
  ] ++ lib.optionals isX86Linux [
    davinci-resolve-studio
  ];
}
