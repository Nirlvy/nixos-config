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

    # node
    eslint
    nodejs
    pnpm
    typescript
    typescript-language-server

    # python
    black
    conda
    micromamba
    virtualenv

    # rust
    rustup

    # misc
    devbox
    devenv
    lazygit
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
