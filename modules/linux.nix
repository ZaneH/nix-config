# modules/linux.nix
{ config, pkgs, lib, plasma-manager, ... }:

{
  #######################################################################
  # 1. Extra system modules to import                                   #
  #######################################################################
  imports = [
    ../modules/kde.nix
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
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

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

    environment.systemPackages = with pkgs; [
      neovim
      zoxide
      tree
      tealdeer
      wget
      xclip
      vlc
      transmission_4-qt
      pavucontrol
      vscode
      thunderbird
      brave
      fd
      htop
      ripgrep
      ffmpeg
      direnv
      btop
      jq
      git
      postgresql
      uv
      ngrok
      httpie
      pnpm
      tmux
    ];
  };
}
