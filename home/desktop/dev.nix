{pkgs, ...}: {
  home.packages = with pkgs; [
    devenv
    devbox

    conda
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
