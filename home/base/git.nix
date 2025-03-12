{
  programs.git = {
    enable = true;

    userName = "Nirlvy";
    userEmail = "nirlvy@outlook.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };
  };
}
