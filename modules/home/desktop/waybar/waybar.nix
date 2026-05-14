{
  config,
  lib,
  ...
}: {
  imports = [
    ./waybar-settings.nix
    ./waybar-styles.nix
  ];

  config = lib.mkIf config.modules.waybar.enable {
    programs.waybar.enable = true;
    home.file.".config/waybar/assets" = {
      source = ./assets;
      recursive = true;
    };
  };
}
