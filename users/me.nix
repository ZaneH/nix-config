
{ config, pkgs, home-manager, plasma-manager, lib, ... }:

let
  username = "me";

  # 👇 Define exactly the packages this user wants
  userPackages = with pkgs; [
  ];
in
{
  # 1) Create the UNIX account
  users.extraUsers.${username} = {
    isNormalUser = true;
    home         = "/home/${username}";
    extraGroups  = [ "wheel" ];
    initialHashedPassword = "";
  };

  # 2) Wire up Home-Manager
  home-manager.users = {
    "${username}" = {
      home.username      = username;
      home.homeDirectory = "/home/${username}";

      imports = [
        ../modules/kde-home.nix
        ../modules/development.nix
        ../modules/entertainment.nix
      ];

      programs.zsh.enable = true;

      # 3) Inject your per-user package list here
      home.packages = userPackages;
    };
  };
  
}

