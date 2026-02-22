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
    ]
    ++ lib.optionals isX86Linux [
      slack
      discord-canary
    ]
    ++ lib.optionals isARMLinux [
      slacky
    ];
  programs.vesktop = {
    enable = true;
    vencord = {
      settings = {
        useQuickCss = true;
      };
      extraQuickCss = ''
        ul[aria-label="Direct Messages"] li:has([href="/store"],[href="/shop"],[href="/quest-home"]) {
            display: none;
        }
      '';
    };
  };
}
