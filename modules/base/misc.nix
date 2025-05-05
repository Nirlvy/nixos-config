{
  programs.adb.enable = true;
  users.users.nirlvy.extraGroups = [ "adbusers" ];

  programs.zsh.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  programs.less.enable = true;

  documentation.enable = false;
}
