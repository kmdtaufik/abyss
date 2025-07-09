#!/usr/bin/env bash
config_file="$HOME/.config/hypr/hyprland.conf"
echo "Reading from: $config_file"

keybinds=$(awk -F',' '
    # Only match lines starting with "bind =" or "bindm ="
    /^[ \t]*bind[m]?[ \t]*=[ \t]*/ {
        # Replace $mainMod with SUPER
        gsub(/\$mainMod/, "SUPER")

        # Remove "bind = " or "bindm = " prefix
        sub(/^bind[m]?[ \t]*=[ \t]*/, "")

        # Fields: $1 = MOD, $2 = KEY, $3 = CMD (possibly with args)
        mod = gensub(/^[ \t]+|[ \t]+$/, "", "g", $1)
        key = gensub(/^[ \t]+|[ \t]+$/, "", "g", $2)
        cmd = substr($0, index($0, $3))  # get full command starting from $3

        # Format: KEY_COMBO  <newline>  COMMAND
        print mod " + " key "\r" cmd
    }
' "$config_file")

sleep 0.2
rofi -dmenu -i -markup -eh 2 -replace -p "Keybinds" -config "$HOME/.config/rofi/config-compact.rasi" <<< "$keybinds"
