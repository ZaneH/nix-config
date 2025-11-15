{ config, pkgs, lib, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      cifs-utils
    ];
    # For SMB credentials, create /root/.smbcredentials with:
    # username=your_username
    # password=your_password
    # domain=WORKGROUP  (if needed)
    # 
    # Then set permissions: chmod 600 /root/.smbcredentials
    fileSystems."/mnt/storage" = {
      device = "//10.0.0.76/storage";
      fsType = "cifs";
      options = [
        "credentials=/root/.smbcredentials"
        "uid=1000"
        "gid=100"
        "x-systemd.automount"
        "nofail"
        "x-systemd.idle-timeout=300"
      ];
    };
  };
}
