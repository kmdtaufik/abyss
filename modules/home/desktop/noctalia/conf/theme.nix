{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia.settings = {
      # Wallpaper — the dynamic wallpaper flow (`wallpaper` script) owns this path.
      # Stylix's noctalia target sets this to the flake snapshot, so force the
      # live path to keep runtime wallpaper changes working.
      wallpaper.default.path = lib.mkForce "${config.home.homeDirectory}/.config/abyss/.cache/current_wallpaper.png";
    };
  };
}
