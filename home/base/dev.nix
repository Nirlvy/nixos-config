{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # c/c++
    # autoconf
    # automake
    # bison
    clang-analyzer
    clang-tools
    cmake
    gcc
    # gdb
    gnumake
    # pkgconf

    # lua
    lua
    luarocks
    lua-language-server
    stylua

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
    # conda
    ruff
    # micromamba
    # poetry
    pyright
    python3
    uv

    # rust
    rustup

    # misc
    # devbox
    # devenv
    lazygit
    tree-sitter
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
