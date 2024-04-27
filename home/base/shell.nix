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
        nfu="nix flake update";
        sns = "sudo nixos-rebuild switch --show-trace -L --verbose";
        ll = "ls -alF";
        c = "clear";
      };
    };

    starship = {
      enable = true;
      settings = {
        aws.symbol = "  ";

        buf.symbol = " ";

        c.symbol = " ";

        conda.symbol = " ";

        crystal.symbol = " ";

        dart.symbol = " ";

        directory.read_only = " 󰌾";

        docker_context.symbol = " ";

        elixir.symbol = " ";

        elm.symbol = " ";

        fennel.symbol = " ";

        fossil_branch.symbol = " ";

        git_branch.symbol = " ";

        golang.symbol = " ";

        guix_shell.symbol = " ";

        haskell.symbol = " ";

        haxe.symbol = " ";

        hg_branch.symbol = " ";

        hostname.ssh_symbol = " ";

        java.symbol = " ";

        julia.symbol = " ";

        kotlin.symbol = " ";

        lua.symbol = " ";

        memory_usage.symbol = "󰍛 ";

        meson.symbol = "󰔷 ";

        nim.symbol = "󰆥 ";

        nix_shell.symbol = " ";

        nodejs.symbol = " ";

        ocaml.symbol = " ";

        os.symbols = {
          Alpaquita = " ";
          Alpine = " ";
          AlmaLinux = " ";
          Amazon = " ";
          Android = " ";
          Arch = " ";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          DragonFly = "; ";
          Emscripten = " ";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = "󰛓 ";
          Gentoo = " ";
          HardenedBSD = "󰞌 ";
          Illumos = "󰈸 ";
          Kali = " ";
          Linux = " ";
          Mabox = " ";
          Macos = " ";
          Manjaro = " ";
          Mariner = " ";
          MidnightBSD = " ";
          Mint = " ";
          NetBSD = " ";
          NixOS = " ";
          OpenBSD = "󰈺 ";
          openSUSE = " ";
          OracleLinux = "󰌷 ";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Redox = "󰀘 ";
          Solus = "󰠳 ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = "󰍲 ";
        };

        package.symbol = "󰏗 ";

        perl.symbol = " ";

        php.symbol = " ";

        pijul_channel.symbol = " ";

        python.symbol = " ";

        rlang.symbol = "󰟔 ";

        ruby.symbol = " ";

        rust.symbol = " ";

        scala.symbol = " ";

        swift.symbol = " ";

        zig.symbol = " ";
      };
    };
    autojump.enable = true;
  };
}
