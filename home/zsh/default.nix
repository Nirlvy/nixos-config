{ config, pkgs, ... }:

{

  programs.zsh = {

    enable = true;

    dotDir = ".config/zsh";

    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
    };

    autocd = true;
    enableCompletion = true;

    historySubstringSearch.enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    # plugins = [
    #   {
    #     name = "powerlevel10k";
    #     src = pkgs.zsh-powerlevel10k;
    #     file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    #   }
    #   {
    #     name = "powerlevel10k-config";
    #     src = ./p10k-config;
    #     file = ".p10k.zsh";
    #   }
    # ];

    initExtra = ''
      # export PATH=/home/nirlvy/.local/bin/:$PNPM_HOME:$PATH
      # export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
      export RUST_LOG=debug

      bindkey "^[[H" beginning-of-line
      bindkey "^[[F" end-of-line
      bindkey "\e[3~" delete-char
    '';

    profileExtra = ''
      # export LIBVA_DRIVER_NAME=nvidia
      # export XDG_SESSION_TYPE=wayland
      # export GBM_BACKEND=nvidia-drm
      # export __GLX_VENDOR_LIBRARY_NAME=nvidia
      # export WLR_NO_HARDWARE_CURSORS=1
      # export QT_SCREEN_SCALE_FACTORS=1

      # export QT_QPA_PLATFORMTHEME=qt6ct
      # export QT_QPA_PLATFORM=wayland
    '';

    shellAliases = {
      ll = "ls -alF --color=auto";
      c = "clear";
    };

  };

  programs.autojump.enableZshIntegration = true;

  programs.starship.enable = true;

}
