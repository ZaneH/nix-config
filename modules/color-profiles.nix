{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    argyllcms
    displaycal
  ];
}
