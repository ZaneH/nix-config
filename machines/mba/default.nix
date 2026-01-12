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
    modules.desktop
    modules.sops
    home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../users/me.nix
  ];

  networking.hostName = host;
  
  home-manager.sharedModules = [
    plasma-manager.homeModules.plasma-manager
    modules.plasmaConfig
  ];
  
  # Apple Silicon specific boot configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  
  hardware.asahi.peripheralFirmwareDirectory = /etc/nixos/firmware;

  # Networking for Apple Silicon
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  # Plasma on Wayland (no need for xserver on Wayland, but we keep it for X11 fallback)
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Remove these packages since they're redundant with what's in linux.nix
  # environment.systemPackages = with pkgs; [
  #   brave
  # ];

  system.stateVersion = "25.11";
}
