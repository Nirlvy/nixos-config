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

      initContent = ''
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
        nix-locate = "nix run github:nix-community/nix-index-database --";
        nix-tree = "nix run nixpkgs#nix-tree -- /etc/nixos#nixosConfigurations.\"NullPointer\".config.system.build.toplevel";
      };
    };

    starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
      };
    };

    eza.enable = true;
    fzf =
      let
        command = "fd --type f -L -E node_modules --strip-cwd-prefix";
      in
      {
        enable = true;
        changeDirWidgetCommand = "fd --type d";
        changeDirWidgetOptions = [ "--preview 'eza --tree --color=always {} | head -200'" ];
        defaultCommand = command;
        defaultOptions = [
          " --preview 'bat --color=always {}'"
          " --preview-window '~3'"
          " --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284"
          " --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf"
          " --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
          " --color=selected-bg:#51576d"
          " --multi"
        ];
        fileWidgetCommand = command;
      };
    zoxide.enable = true;
  };
}
