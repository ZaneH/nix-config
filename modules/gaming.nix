{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      # For AMD + DaVinci Resove
      rocmPackages.clr.icd
    ];
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    protonup-ng
  ];
}
