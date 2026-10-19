{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.obs.enable {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vkcapture
        obs-vaapi
        obs-gstreamer
      ];
    };
  };
}
