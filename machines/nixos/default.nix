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
    modules.nvidiaPassthrough
    modules.virtualisation
    modules.networkDrives
    modules.tailscale
    modules.sops
    modules.gaming
    modules.backup
    modules.gpuScreenRecorder
    modules.printers
    modules.ollama
    modules.openVpn
    modules.private
    home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../users/me.nix
  ];
  
  networking.hostName = host;
  
  # Add plasma-manager to home-manager sharedModules for this machine
  home-manager.sharedModules = [
    plasma-manager.homeModules.plasma-manager
    modules.plasmaConfig
  ];
  
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  system.stateVersion = "25.05";
}
