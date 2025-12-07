{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];

  sops = {
    validateSopsFiles = true;
    
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";
    };
    secrets = {
      # SSH private key
      "id_ed25519" = {
        sopsFile = ./../secrets/ssh.yaml;
        owner = "me";
        path = "/home/me/.ssh/id_ed25519";
        mode = "0600";
      };
      "id_ed25519_pub" = {
        sopsFile = ./../secrets/ssh.yaml;
        owner = "me";
        path = "/home/me/.ssh/id_ed25519.pub";
        mode = "0600";
      };
      # Git configuration
      "gitconfig" = {
        sopsFile = ./../secrets/git.yaml;
        owner = "me";
        path = "/home/me/.gitconfig";
        mode = "0644";
      };
    };
  };
}