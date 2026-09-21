{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    claude-code
    opencode
  ];

  # programs.omp = {
  #   enable = true;
  #   settings.startup.quiet = true;
  # };
}
