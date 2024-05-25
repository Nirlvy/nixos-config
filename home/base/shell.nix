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

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        export RUST_LOG=debug

        bindkey "^H" beginning-of-line
        bindkey "^F" end-of-line
        bindkey "\e3~" delete-char
        bindkey "''${key[Up]}" up-line-or-search
        bindkey "''${key[Down]}" down-line-or-search
      '';

      shellAliases = {
        nfu = "nix flake update";
        sns = "sudo nixos-rebuild switch --show-trace -L -v";
        ll = "ls -alF";
        c = "clear";
      };
    };

    starship.enable = true;
    autojump.enable = true;
    nix-index.enable = true;
  };
}
