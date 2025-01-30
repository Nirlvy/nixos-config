{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ pulseaudio ];

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    printing.enable = false;

    libinput.enable = true;

    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
  };

  # pulseaudio need it
  security.rtkit.enable = true;

  services.pulseaudio.enable = false;
}
