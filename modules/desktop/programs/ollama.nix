{ pkgs, ... }:
{
  services.ollama = {
    enable = false;
    package = pkgs.ollama-cuda;
  };

  services.open-webui.enable = false;
}
