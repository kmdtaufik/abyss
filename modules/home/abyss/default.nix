{pkgs, ...}: {
  home.packages = [
    (import ./scripts/clipboard.nix {inherit pkgs;})
    (import ./scripts/screenshot.nix {inherit pkgs;})
    (import ./scripts/toggle-floating.nix {inherit pkgs;})
    (import ./scripts/hyprshade-menu.nix {inherit pkgs;})
    (import ./scripts/hypridle-menu.nix {inherit pkgs;})
    (import ./scripts/moveTo.nix {inherit pkgs;})
    (import ./scripts/hyprland-keybinds.nix {inherit pkgs;})
    (import ./scripts/emoji/emojipicker.nix {inherit pkgs;})
    (import ./scripts/xdg-run.nix {inherit pkgs;})
    (import ./scripts/restore-wallpaper.nix {inherit pkgs;})
    (import ./scripts/launch-waybar.nix {inherit pkgs;})
    (import ./scripts/launch-wlogout.nix {inherit pkgs;})
    (import ./scripts/gtk.nix {inherit pkgs;})
  ];
}
