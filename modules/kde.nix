{ config, pkgs, lib, ... }:

lib.mkIf pkgs.stdenv.isLinux {
  # 1) Enable SDDM & Plasma (only on Linux)
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # 2) Exclude unwanted KDE apps
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    kate
  ];
}
