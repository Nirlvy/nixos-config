{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clang-analyzer
    clang-tools
    cmake
    gcc
    gnumake

    nixd
    nixfmt-rfc-style
  ];
}
