# modules/linux.nix
{ config, pkgs, lib, plasma-manager, ... }:

{
  #######################################################################
  # 1. Extra system modules to import                                   #
  #######################################################################
  imports = [
    ../modules/kde.nix
    ../modules/virtualisation.nix
  ];

  #######################################################################
  # 2. System-wide configuration                                        #
  #######################################################################
  config = {
    ####################   Home-Manager glue   ####################
    home-manager.sharedModules = [
      plasma-manager.homeModules."plasma-manager" # provides `programs.plasma`
      ../modules/kde-home.nix # Plasma config
    ];

    ####################   Boot & kernel   ####################
    ### Configured for GPU Passthrough with an NVIDIA card  ###
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "nodev";
    boot.loader.grub.efiSupport = true;
    boot.loader.grub.efiInstallAsRemovable = true;
    boot.loader.systemd-boot.enable = false;
    boot.loader.efi.canTouchEfiVariables = false;
    boot.blacklistedKernelModules = [ "nvidia" "nouveau" "nvidia_drm" "nvidia_modeset" ];
    boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

    ####################   Core services   ####################
    networking.networkmanager.enable = true;

    services.printing.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.openssh.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    ####################   System Packages   ##################
    environment.systemPackages = with pkgs; [
      zoxide
      tree
      tealdeer
      wget
      git
      git-lfs
      xclip
      transmission_4-qt
      pavucontrol
      brave
      fd
      neofetch
      htop
      btop
      ripgrep
      inetutils
      usbutils
      nftables
      lsof
      file
      steam
      linuxKernel.packages.linux_zen.cpupower
      dmidecode
      psmisc
      sops
      age
    ];
  };
}
