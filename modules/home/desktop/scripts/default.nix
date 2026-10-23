{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages =
    [
      (import ./restore-wallpaper.nix {inherit pkgs config;})
      (import ./wallpaper.nix {inherit pkgs config;})
      (import ./mount-manager.nix {inherit pkgs;})
      (import ./toggle-bangla.nix {inherit pkgs;})
    ]
    ++ lib.optionals (config.modules.hyprland.enable || !config.modules.noctalia.enable) [
      (import ./clipboard.nix {inherit pkgs;})
    ]
    ++ lib.optionals config.modules.hyprland.enable [
      (import ./screenshot.nix {inherit pkgs;})
      (import ./toggle-floating.nix {inherit pkgs;})
      (import ./hypridle-menu.nix {inherit pkgs;})
      (import ./moveTo.nix {inherit pkgs;})
      (import ./hyprland-keybinds.nix {inherit pkgs;})
    ]
    ++ lib.optionals config.modules.waybar.enable [
      (import ./launch-waybar.nix {inherit pkgs;})
    ]
    ++ lib.optionals config.modules.wlogout.enable [
      (import ./launch-wlogout.nix {inherit pkgs;})
    ];
}
