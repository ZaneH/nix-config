{ config, lib, ... }:

{
  services.pia = {
    enable = true;
    authUserPassFile = config.sops.secrets.pia.path;
  };
}