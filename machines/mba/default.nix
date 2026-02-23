{
  config,
  modules,
  pkgs,
  host,
  home-manager,
  plasma-manager,
  ...
}:

{
  imports = [
    modules.universal
    modules.linux
    modules.nvim
    modules.desktop
    modules.sops
    modules.networkDrives
    modules.printers
    home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../users/me.nix
  ];

  networking.hostName = host;

  home-manager.sharedModules = [
    plasma-manager.homeModules.plasma-manager
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  hardware.asahi.peripheralFirmwareDirectory = /etc/nixos/firmware;

  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  system.stateVersion = "25.11";
}
