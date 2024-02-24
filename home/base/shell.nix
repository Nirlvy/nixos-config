{

  programs = {

    bash = {
      enable = true;

      historyControl = [
        "ignoredups"
        "erasedups"
      ];
    };

    zsh = {
      enable = true;

      dotDir = ".config/zsh";

      history = {
        path = "$ZDOTDIR/zsh_history";
        expireDuplicatesFirst = true;
        ignoreAllDups = true;
      };

      autocd = true;
      enableCompletion = true;

      historySubstringSearch.enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        export RUST_LOG=debug

        bindkey "^[[H" beginning-of-line
        bindkey "^[[F" end-of-line
        bindkey "\e[3~" delete-char
      '';

      profileExtra = ''
        # export QT_QPA_PLATFORMTHEME=qt6ct
        # export QT_QPA_PLATFORM=wayland
      '';

      shellAliases = {
        ll = "ls -alF --color=auto";
        c = "clear";
      };

    };

    nushell.enable = true;

    starship.enable = true;
    autojump.enable = true;

  };

}
