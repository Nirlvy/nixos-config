{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # c/c++
    # autoconf
    # automake
    # bison
    # clang-tools
    # cmake
    gcc
    # gdb
    gnumake
    # pkgconf

    # lua
    # lua
    # lua-language-server
    # stylua

    # nix
    nixd
    nixfmt-rfc-style

    # node
    # eslint
    # nodejs
    # pnpm
    # typescript
    # typescript-language-server
    # vtsls

    # python
    ruff
    python3
    uv

    # rust
    rustup
    # cargo
    # rustfmt
    # clippy

    # misc
    # devbox
    # devenv
    lazygit
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
