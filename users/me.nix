
{ config, pkgs, home-manager, plasma-manager, lib, ... }:

let
  username = "me";

  # 👇 Define exactly the packages this user wants
  userPackages = with pkgs; [
    discord
    discord-canary
    moonlight-qt
    google-chrome
    geekbench_5
    blender
    ticker
  ];
in
{
  # 1) Create the UNIX account
  users.extraUsers.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "wheel" ];
    uid = 1000;
    initialHashedPassword = "$y$j9T$HY94rD7gaT78XgT3mZVlW/$C6rSif/qBW5A.l/UFTrnv009o5U0z5dvK8oDYRSSKH4"; # "password"
  };

  programs.zsh.enable = true;
  users.users.${username}.shell = pkgs.zsh;

  # 2) Wire up Home-Manager
  home-manager.users = {
    "${username}" = {
      home.username = username;
      home.homeDirectory = "/home/${username}";
      imports = [
        ../modules/kde-home.nix
        ../modules/development.nix
        ../modules/entertainment.nix
      ];
      # 3) Inject your per-user package list here
      home.packages = userPackages;
    };
  };
}

