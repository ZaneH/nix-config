{ pkgs, ... }:

{
  home.packages = with pkgs; [
    julia
    octave
    matlab-language-server
  ];
}
