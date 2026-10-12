{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    claude-code
    opencode
    pi
    herdr
  ];

  # programs.omp = {
  #   enable = true;
  #   settings.startup.quiet = true;
  # };
}
