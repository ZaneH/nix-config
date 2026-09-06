{ username, lib, ... }:

{
  systemd.services.calibre-web.serviceConfig = {
    ProtectHome = lib.mkForce false;
  };
  networking.firewall.allowedTCPPorts = [ 8083 ];

  services.calibre-web = {
    enable = true;
    user = "${username}";
    openFirewall = true;
    dataDir = "/home/${username}/repos/books/Calibre-Web";
    options = {
      calibreLibrary = "/home/${username}/repos/books/CalibreLibrary";
      enableBookUploading = true;
    };
    listen = {
      ip = "0.0.0.0";
      port = 8083;
    };
  };
}
