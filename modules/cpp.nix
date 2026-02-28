{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gcc
    conan
    gdb
    cmake-language-server
    clang-tools
    ccls
    ninja
    cmake
  ];
}
