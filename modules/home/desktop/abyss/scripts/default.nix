{pkgs, ...}: {
  home.packages = [
    (import ./clipboard.nix {inherit pkgs;})
    (import ./screenshot.nix {inherit pkgs;})
    (import ./toggle-floating.nix {inherit pkgs;})
    (import ./hyprshade-menu.nix {inherit pkgs;})
    (import ./hypridle-menu.nix {inherit pkgs;})
    (import ./moveTo.nix {inherit pkgs;})
    (import ./hyprland-keybinds.nix {inherit pkgs;})
    (import ./emoji/emojipicker.nix {inherit pkgs;})
    (import ./xdg-run.nix {inherit pkgs;})
    (import ./restore-wallpaper.nix {inherit pkgs;})
    (import ./launch-waybar.nix {inherit pkgs;})
    (import ./launch-wlogout.nix {inherit pkgs;})
    (import ./gtk.nix {inherit pkgs;})
    (import ./wallpaper.nix {inherit pkgs;})
    (import ./mount-manager.nix {inherit pkgs;})
  ];
}
