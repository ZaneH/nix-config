{ pkgs, lib, ... }:
let
  isX86Linux = pkgs.stdenv.hostPlatform.system == "x86_64-linux";
  isARMLinux = pkgs.stdenv.hostPlatform.system == "aarch64-linux";
in
{
  home.packages =
    with pkgs;
    [
      element-desktop
      vesktop
    ]
    ++ lib.optionals isX86Linux [
      slack
      discord-canary
    ]
    ++ lib.optionals isARMLinux [
      slacky
    ];
}
