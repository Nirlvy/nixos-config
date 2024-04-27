{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-utils
    xdg-user-dirs
  ];

  xdg = {
    configFile."mimeapps.list".force = true;

    mimeApps = {
      enable = true;
      defaultApplications = let
        browser = ["firefox.desktop"];
        editor = ["code.desktop"];
      in {
        "application/json" = browser;
        "application/pdf" = browser;

        "text/html" = browser;
        "text/xml" = browser;
        "text/plain" = editor;
        "application/xml" = browser;
        "application/xhtml+xml" = browser;
        "application/xhtml_xml" = browser;
        "application/rdf+xml" = browser;
        "application/rss+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "application/x-wine-extension-ini" = editor;

        "x-scheme-handler/about" = browser;
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/vscode" = ["code-url-handler.desktop"];
        "x-scheme-handler/vscode-insiders" = ["code-insiders-url-handler.desktop"];
        "x-scheme-handler/unknown" = editor;

        "x-scheme-handler/discord" = ["discord.desktop"];
        "x-scheme-handler/tg" = ["org.telegram.desktop.desktop "];

        "audio/*" = ["mpv.desktop"];
        "video/*" = ["mpv.dekstop"];
        "image/*" = ["lximage-qt.desktop"];
        "image/gif" = ["lximage-qt.desktop"];
        "image/jpeg" = ["lximage-qt.desktop"];
        "image/png" = ["lximage-qt.desktop"];
        "image/webp" = ["lximage-qt.desktop"];
      };
    };
  };
}
