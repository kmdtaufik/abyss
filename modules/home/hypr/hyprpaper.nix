{pkgs, ...}: {
  services.hyprpaper = {
    enable = true;
    #Todo: add support for dynamic wallpaper selection
    settings = {
      preload = ["~/.config/abyss/.cache/current_wallpaper.png"];
      wallpaper = [",~/.config/abyss/.cache/current_wallpaper.png"];
    };
  };
  home.packages = [
    pkgs.hyprpaper
  ];
}
