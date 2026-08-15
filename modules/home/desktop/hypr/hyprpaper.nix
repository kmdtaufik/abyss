{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        wallpaper = [
          {
            monitor = "";
            path = "~/.config/abyss/.cache/current_wallpaper.png";
          }
        ];
      };
    };
    home.packages = [
      pkgs.hyprpaper
    ];
  };
}
