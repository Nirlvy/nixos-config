{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    deadnix
    alejandra
  ];
}
