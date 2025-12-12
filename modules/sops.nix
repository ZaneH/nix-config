{
  config,
  pkgs,
  lib,
  ...
}:

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
      # SSH keys
      "id_rsa_personal" = {
        sopsFile = ./../secrets/ssh.yaml;
        # TODO: Make the uid and path not hard-coded
        uid = 1000;
        path = "/home/me/.ssh/id_rsa_personal";
        mode = "0600";
      };
      "id_rsa_personal_pub" = {
        sopsFile = ./../secrets/ssh.yaml;
        uid = 1000;
        path = "/home/me/.ssh/id_rsa_personal.pub";
        mode = "0600";
      };
      # SSH configuration
      "config" = {
        sopsFile = ./../secrets/ssh.yaml;
        uid = 1000;
        path = "/home/me/.ssh/config";
        mode = "0644";
      };
      # Git configuration
      "gitconfig" = {
        sopsFile = ./../secrets/git.yaml;
        uid = 1000;
        path = "/home/me/.gitconfig";
        mode = "0644";
      };
    };
  };
}
