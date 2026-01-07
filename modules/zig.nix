{
  pkgs,
  zig,
  ...
}:

{
  home.packages = with pkgs; [
    zigpkgs.master-2026-01-04
    zls
  ];
}
