{pkgs, ...}:
pkgs.writers.writeBashBin "launch-bar" {}
/*
bash
*/
''
  echo ":: Killing waybar..."
  killall waybar 2>/dev/null
  pkill waybar 2>/dev/null

  echo ":: Starting waybar..."
  waybar &

''
