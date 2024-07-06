{ pkgs, ... }:
{
  home.packages = with pkgs; [
    devenv
    devbox

    conda
    micromamba
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
