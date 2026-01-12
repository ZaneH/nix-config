{ pkgs, config, lib, ... }:

{
  programs.virt-manager.enable = true;
  
  users.groups.libvirtd.members = [ "me" ];
  users.groups.docker.members = [ "me" ];
  
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;

  # Network bridge configuration (only if interface exists)
  networking.useDHCP = lib.mkDefault false;
  
  # Optional: Only configure bridge if on the desktop machine
  # You can make this conditional or move to machine-specific config
  networking.interfaces = lib.mkIf (config.networking.hostName == "nixos") {
    enp42s0.useDHCP = false;
    br0.useDHCP = true;
  };
  
  networking.bridges = lib.mkIf (config.networking.hostName == "nixos") {
    br0.interfaces = [ "enp42s0" ];
  };
  
  networking.networkmanager.unmanaged = lib.mkIf (config.networking.hostName == "nixos") [ 
    "enp42s0" 
  ];
}
