{
  config,
  lib,
  pkgs,
  ...
}: let
  dropterminal = pkgs.writeShellApplication {
    name = "DropTerminal.sh";
    runtimeInputs = with pkgs; [jq bc gnused gawk];

    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      DEBUG=false
      SPECIAL_WS="special:dropterminal"
      ADDR_FILE="/tmp/dropdown_terminal_addr"
      SPAWN_ONLY=false

      WIDTH_PERCENT=65
      HEIGHT_PERCENT=65
      Y_PERCENT=10

      if [ "''${1-}" = "-d" ] || [ "''${1-}" = "--debug" ]; then
        DEBUG=true; shift || true
      fi
      if [ "''${1-}" = "-S" ] || [ "''${1-}" = "--spawn-only" ]; then
        SPAWN_ONLY=true; shift || true
      fi

      TERMINAL_CMD="''${1-}"
      if [ -z "''${TERMINAL_CMD}" ]; then
        TERMINAL_CMD="kitty"
      fi

      debug_echo() { if [ "$DEBUG" = true ]; then echo "$@" >&2; fi; }

      hyprjson() {
        hyprctl "$@" -j 2>/dev/null | sed -E 's/: *nan([,}])/ : null\1/gi; s/: *-nan([,}])/ : null\1/gi; s/: *inf([,}])/ : null\1/gi; s/: *-inf([,}])/ : null\1/gi'
      }

      get_monitor_info() {
        local monitor_data
        monitor_data=$(hyprjson monitors | jq -r '.[] | select(.focused == true) | "\(.x) \(.y) \(.width) \(.height) \(.scale // 1) \(.name)"')
        if [ -z "$monitor_data" ] || [[ "$monitor_data" =~ ^null ]]; then return 1; fi
        echo "$monitor_data"
      }

      calculate_dropdown_position() {
        local monitor_info
        if ! monitor_info=$(get_monitor_info); then
          echo "100 100 800 600 fallback"
          return 1
        fi

        local mon_x mon_y mon_width mon_height mon_scale mon_name
        mon_x=$(echo "$monitor_info" | cut -d' ' -f1)
        mon_y=$(echo "$monitor_info" | cut -d' ' -f2)
        mon_width=$(echo "$monitor_info" | cut -d' ' -f3)
        mon_height=$(echo "$monitor_info" | cut -d' ' -f4)
        mon_scale=$(echo "$monitor_info" | cut -d' ' -f5)
        mon_name=$(echo "$monitor_info" | cut -d' ' -f6)

        if [ -z "$mon_scale" ] || [ "$mon_scale" = "null" ] || [ "$mon_scale" = "0" ]; then mon_scale="1.0"; fi

        local logical_width logical_height scale_int
        if command -v bc >/dev/null 2>&1; then
          logical_width=$(echo "scale=0; $mon_width / $mon_scale" | bc | cut -d'.' -f1)
          logical_height=$(echo "scale=0; $mon_height / $mon_scale" | bc | cut -d'.' -f1)
        else
          scale_int=$(echo "$mon_scale" | sed 's/\.///' | sed 's/^0*//')
          if [ -z "$scale_int" ]; then scale_int=100; fi
          logical_width=$(((mon_width * 100) / scale_int))
          logical_height=$(((mon_height * 100) / scale_int))
        fi

        local width height y_offset x_offset final_x final_y
        width=$((logical_width * WIDTH_PERCENT / 100))
        height=$((logical_height * HEIGHT_PERCENT / 100))
        y_offset=$((logical_height * Y_PERCENT / 100))
        x_offset=$(((logical_width - width) / 2))

        final_x=$((mon_x + x_offset))
        final_y=$((mon_y + y_offset))

        echo "$final_x $final_y $width $height $mon_name"
      }

      get_terminal_address() {
        if [ -f "$ADDR_FILE" ] && [ -s "$ADDR_FILE" ]; then cut -d' ' -f1 "$ADDR_FILE"; fi
      }

      terminal_exists() {
        local addr
        addr=$(get_terminal_address)
        if [ -n "$addr" ]; then
          hyprjson clients | jq -e --arg ADDR "$addr" 'map(select(.address == $ADDR)) | any' >/dev/null 2>&1
        else
          return 1
        fi
      }

      spawn_terminal() {
        debug_echo "Creating new dropdown terminal..."

        local pos_info target_x target_y width height monitor_name
        if ! pos_info=$(calculate_dropdown_position); then pos_info="100 100 800 600 fallback"; fi
        read -r target_x target_y width height monitor_name <<<"$pos_info"

        local token title spawn_cmd
        token=$(date +%s%N)
        title="dropterm-$token"
        spawn_cmd="$TERMINAL_CMD --class dropterminal --instance-group dropterminal --title $title"

        # Spawn directly into the special workspace, float it, and size it
        hyprctl dispatch exec "[float; size $width $height; move $target_x $target_y; workspace $SPECIAL_WS silent] $spawn_cmd" >/dev/null 2>&1 || true

        local new_addr=""
        for _ in $(seq 1 60); do
          new_addr=$(hyprjson clients | jq -r --arg CLS "dropterminal" --arg TITLE "$title" \
            '.[] | select(.class == $CLS and .title == $TITLE) | .address' | head -n 1)
          if [ -n "$new_addr" ]; then break; fi
          sleep 0.05
        done

        if [ -n "$new_addr" ] && [ "$new_addr" != "null" ]; then
          echo "$new_addr $monitor_name" >"$ADDR_FILE"

          # Force exact geometry in background to bypass terminal's internal padding
          hyprctl dispatch resizewindowpixel "exact $width $height,address:$new_addr" >/dev/null 2>&1 || true
          hyprctl dispatch movewindowpixel "exact $target_x $target_y,address:$new_addr" >/dev/null 2>&1 || true

          if [ "$SPAWN_ONLY" = false ]; then
            hyprctl dispatch togglespecialworkspace dropterminal
          fi
          return 0
        fi
        return 1
      }

      # --- MAIN LOGIC ---
      if terminal_exists; then
        TERMINAL_ADDR=$(get_terminal_address)

        # 1. Calculate perfect geometry for whichever monitor your mouse is currently on
        pos_info=$(calculate_dropdown_position)
        read -r target_x target_y width height monitor_name <<<"$pos_info"

        # 2. Instantly update the window size/position while it is safely hidden
        hyprctl dispatch movewindowpixel "exact $target_x $target_y,address:$TERMINAL_ADDR" >/dev/null 2>&1 || true
        hyprctl dispatch resizewindowpixel "exact $width $height,address:$TERMINAL_ADDR" >/dev/null 2>&1 || true

        # 3. Trigger Hyprland's native, GPU-accelerated special workspace toggle
        hyprctl dispatch togglespecialworkspace dropterminal
      else
        spawn_terminal
      fi
    '';
  };
in {
  config = lib.mkIf config.modules.dropTerm.enable {
    home.packages = [dropterminal];
  };
}
