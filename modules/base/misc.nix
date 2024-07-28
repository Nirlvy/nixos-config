{
  environment.enableAllTerminfo = true;

  programs.adb.enable = true;
  users.users.nirlvy.extraGroups = [ "adbusers" ];

  zramSwap.enable = true;
}
