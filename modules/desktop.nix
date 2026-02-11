{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./kde.nix
    ./bluetooth.nix
  ];
}
