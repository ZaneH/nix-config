{
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    claude-code
    opencode
    pi
    herdr
    collie
    poppler-utils # for pdftotext
    # linear
  ];
}
