{ pkgs, ... }:

{
  # Boot configuration for GPU Passthrough with NVIDIA
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  
  boot.blacklistedKernelModules = [
    "nvidia"
    "nouveau"
    "nvidia_drm"
    "nvidia_modeset"
  ];
  
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}