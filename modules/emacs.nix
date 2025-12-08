{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      sha256 = "1b3fcngw5nwgm2362sgvyphp8g4wk3nqvfx9v98rxbhmv9n59dh4";
    }))
  ];
  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
  environment.systemPackages = with pkgs; [
    emacs-pgtk
    copilot-language-server
  ];
}
