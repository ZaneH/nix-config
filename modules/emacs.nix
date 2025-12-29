{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    copilot-language-server
    typescript-language-server
    typescript
    prettierd
  ];
}
