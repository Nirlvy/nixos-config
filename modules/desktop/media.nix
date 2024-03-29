{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    pulseaudio
  ];

  services = {

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    printing.enable = true;

    xserver.libinput.enable = true;

    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

  };

  security.rtkit.enable = true;

  hardware.pulseaudio.enable = false;

}
