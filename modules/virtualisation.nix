{ pkgs, ... }:

{
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["me"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  networking.useDHCP = false;
  networking.interfaces.enp42s0.useDHCP = false;
  networking.bridges.br0.interfaces = [ "enp42s0" ];
  networking.interfaces.br0.useDHCP = true;
  networking.networkmanager.unmanaged = [ "enp42s0" ];
}
