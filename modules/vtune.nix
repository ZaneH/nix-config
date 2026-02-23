{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.intel-oneapi-vtune
  ];
}
