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
      enableCompletion = true;
      enableVteIntegration = true;

      autocd = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      history = {
        expireDuplicatesFirst = true;
        ignoreAllDups = true;
        path = "$ZDOTDIR/zsh_history";
      };
      historySubstringSearch.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        bindkey "^H" beginning-of-line
        bindkey "^F" end-of-line
        bindkey "\e3~" delete-char
        bindkey "''${key[Up]}" up-line-or-search
        bindkey "''${key[Down]}" down-line-or-search
      '';

      shellAliases = {
        nfu = "nix flake update";
        sns = "sudo nixos-rebuild switch --show-trace -L -v";
        e = "env DISPLAY=:0 ";
        c = "clear";
      };
    };

    starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
      };
    };
    nix-index.enable = true;

    eza.enable = true;
    fzf.enable = true;
    zoxide.enable = true;
  };
}
