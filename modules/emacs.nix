{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/b053300454d56dfc6881d465dc1cad11d0fac031.tar.gz";
        sha256 = "0v6pl0zhs476hdfxdhaqk8y5nvibk4nra6rqxmfrq8a7fh230vv2";
      }
    ))
  ];
  environment.systemPackages = with pkgs; [
    copilot-language-server
    typescript-language-server
    typescript
    prettierd
  ];
}
