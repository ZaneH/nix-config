{ config, pkgs, lib, ... }:

{
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
    ffmpeg-headless
    f3d
    gdk-pixbuf
    caligula
    bc
    bind

    (python312.withPackages (
      ps: with ps; [
        pip
        requests
        numpy
        grip
        ruff
      ]
    ))
  ];
}
