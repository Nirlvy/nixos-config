{
  programs.git = {
    enable = true;

    userName = "Nirlvy";
    userEmail = "nirlvy@qq.com";

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      url = {
        "ssh://git@github.com/" = {
          insteadOf = "https://github.com/";
        };
      };
    };
  };
}
