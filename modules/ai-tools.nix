{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    claude-code
    opencode
    pi
  ];

  # programs.omp = {
  #   enable = true;
  #   settings.startup.quiet = true;
  # };
}
