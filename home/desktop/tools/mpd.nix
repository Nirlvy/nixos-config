{
  services.mpd = {
    enable = false;
    network.startWhenNeeded = true;

    musicDirectory = "/home/nirlvy/Music";
    extraConfig = ''
      audio_output {
        type  "pulse"
        name  "pulse audio"
       }'';
  };
}
