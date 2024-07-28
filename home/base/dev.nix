{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # c/c++
    autoconf
    automake
    bison
    clang-analyzer
    clang-tools
    cmake
    gcc
    gdb
    gnumake
    pkgconf

    # nix
    nil
    nixd
    nixfmt-rfc-style

    # python
    black
    conda
    micromamba
    virtualenv

    # misc
    devbox
    devenv
    lazygit
    tree-sitter
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    pylint.enable = true;
  };
}
