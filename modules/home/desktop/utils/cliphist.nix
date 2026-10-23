{
  config,
  lib,
  pkgs,
  ...
}: {
  # Noctalia owns the clipboard unless Hyprland needs cliphist.
  config = lib.mkIf (config.modules.cliphist.enable && (config.modules.hyprland.enable || !config.modules.noctalia.enable)) {
    services.cliphist = {
      enable = true;
      package = pkgs.cliphist;
      allowImages = true;
      clipboardPackage = pkgs.wl-clipboard;
    };
  };
}
