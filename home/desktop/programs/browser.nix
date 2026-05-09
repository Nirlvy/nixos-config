{
  programs = {
    # media.hardware-vedio-decoding.force-enabled = true
    firefox.enable = true;

    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--enable-experimental-web-platform-features"
        "--enable-wayland-ime"
        "--wayland-text-input-version=3"
      ];
    };
  };

  home.sessionVariables = {
    BROWSER = "firefox";

    GOOGLE_DEFAULT_CLIENT_ID = "77185425430.apps.googleusercontent.com";
    GOOGLE_DEFAULT_CLIENT_SECRET = "OTJgUOQcT7lO7GsGZq2G4IlT";
  };
}
