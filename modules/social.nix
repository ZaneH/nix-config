{ pkgs, lib, ... }:
let
  isX86Linux = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
in
{
  home.packages = with pkgs; [
    element-desktop
  ] ++ lib.optionals isX86Linux [
    slack
    discord
    discord-canary
  ];
}
