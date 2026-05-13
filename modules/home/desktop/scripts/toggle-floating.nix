{pkgs, ...}:
pkgs.writeShellApplication {
  name = "toggle-floating";

  text = ''
    # Toggle the layout of all windows in the current workspace to floating/tiling
    hyprctl dispatch workspaceopt allfloat

    # Send a notification to the user
    notify-send "Windows on this workspace toggled to floating/tiling"
  '';
}
