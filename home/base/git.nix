{
  programs.git = {
    enable = true;

    settings = {
      user = {
        email = "nirlvy@outlook.com";
        name = "Nirlvy";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
