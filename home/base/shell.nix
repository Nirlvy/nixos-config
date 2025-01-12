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
    fzf =
      let
        command = "fd --type f -L -E .git -E node_modules . /home /etc/nixos";
      in
      {
        enable = true;
        changeDirWidgetCommand = "fd --type d";
        changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
        defaultCommand = command;
        defaultOptions = [
          " \
            --preview 'bat --color=always {}' \
            --preview-window '~3'
          "
          " \
            --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
            --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
            --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
            --color=selected-bg:#51576d \
            --multi
          "
        ];
        fileWidgetCommand = command;
      };
    zoxide.enable = true;
  };
}
