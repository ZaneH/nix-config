{
  config,
  pkgs,
  lib,
  plasma-manager,
  ...
}:

{
  #######################################################################
  # 1. Extra system modules to import                                   #
  #######################################################################
  imports = [
    ../modules/kde.nix
    ../modules/virtualisation.nix
    ../modules/sops.nix
    ../modules/emacs.nix
    ../modules/gaming.nix
  ];

  #######################################################################
  # 2. System-wide configuration                                        #
  #######################################################################
  config = {
    ####################   Home-Manager glue   ####################
    home-manager.sharedModules = [
      plasma-manager.homeModules."plasma-manager" # provides `programs.plasma`
      ../modules/plasma-config.nix # Plasma config
    ];

    ####################   Boot & kernel   ####################
    ### Configured for GPU Passthrough with an NVIDIA card  ###
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

    services.borgmatic.enable = true;

    ####################   System Packages   ##################
    environment.systemPackages = with pkgs; [
      tree
      tealdeer
      wget
      git
      git-lfs
      xclip
      pavucontrol
      fd
      neofetch
      htop
      btop
      ncdu
      ripgrep
      inetutils
      usbutils
      pciutils
      nftables
      lsof
      file
      xrandr
      linuxKernel.packages.linux_zen.cpupower
      dmidecode
      psmisc
      wireguard-tools

      (python312.withPackages (
        ps: with ps; [
          pip
          requests
          numpy
        ]
      ))
    ];
  };
}
