{ pkgs, ... }:

{

  home.packages = with pkgs; [

    home-manager

    nixpkgs-fmt
    rnix-lsp

  ];

}
