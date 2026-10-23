{
  config,
  lib,
  pkgs,
  ...
}: let
  focusNextOccupied = pkgs.writeShellScriptBin "niri-focus-next-occupied" ''
    # Get workspaces with windows, cycle to next one
    current=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$current" ]; then
      current=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    next=$(${pkgs.niri}/bin/niri msg -j workspaces | ${pkgs.jq}/bin/jq -r --arg cur "''${current:-0}" '
      [.[] | select(.active_window_id != null)] |
      sort_by(.idx) |
      if length == 0 then empty
      else
        (map(.id) | index(($cur | tonumber)) // -1) as $i |
        if $i == -1 or $i >= length - 1 then (.[0].idx // .[0].id)
        else (.[$i + 1].idx // .[$i + 1].id)
        end
      end
    ')
    if [ -n "$next" ]; then
      ${pkgs.niri}/bin/niri msg action focus-workspace $next
    fi
  '';

  focusPrevOccupied = pkgs.writeShellScriptBin "niri-focus-prev-occupied" ''
    # Get workspaces with windows, cycle to previous one
    current=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$current" ]; then
      current=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    prev=$(${pkgs.niri}/bin/niri msg -j workspaces | ${pkgs.jq}/bin/jq -r --arg cur "''${current:-0}" '
      [.[] | select(.active_window_id != null)] |
      sort_by(.idx) |
      if length == 0 then empty
      else
        (map(.id) | index(($cur | tonumber)) // -1) as $i |
        if $i == -1 or $i <= 0 then (.[-1].idx // .[-1].id)
        else (.[$i - 1].idx // .[$i - 1].id)
        end
      end
    ')
    if [ -n "$prev" ]; then
      ${pkgs.niri}/bin/niri msg action focus-workspace $prev
    fi
  '';

  # Cycle through windows on the CURRENT workspace only
  focusNextWindow = pkgs.writeShellScriptBin "niri-focus-next-window" ''
    ws=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$ws" ]; then
      ws=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    if [ -z "$ws" ]; then exit 0; fi

    target=$(${pkgs.niri}/bin/niri msg -j windows | ${pkgs.jq}/bin/jq -r --argjson ws "$ws" '
      [.[] | select(.workspace_id == $ws)] |
      sort_by(.layout.pos_in_scrolling_layout[0] // 0, .layout.pos_in_scrolling_layout[1] // 0, .id) as $windows |
      if ($windows | length) <= 1 then empty
      else
        ($windows | map(.is_focused) | index(true) // -1) as $cur_idx |
        $windows[($cur_idx + 1) % ($windows | length)].id
      end
    ')
    if [ -n "$target" ]; then
      ${pkgs.niri}/bin/niri msg action focus-window --id "$target"
    fi
  '';

  focusPrevWindow = pkgs.writeShellScriptBin "niri-focus-prev-window" ''
    ws=$(${pkgs.niri}/bin/niri msg -j focused-window 2>/dev/null | ${pkgs.jq}/bin/jq -r '.workspace_id // empty')
    if [ -z "$ws" ]; then
      ws=$(${pkgs.niri}/bin/niri msg -j workspaces 2>/dev/null | ${pkgs.jq}/bin/jq -r '.[] | select(.is_focused).id // empty')
    fi
    if [ -z "$ws" ]; then exit 0; fi

    target=$(${pkgs.niri}/bin/niri msg -j windows | ${pkgs.jq}/bin/jq -r --argjson ws "$ws" '
      [.[] | select(.workspace_id == $ws)] |
      sort_by(.layout.pos_in_scrolling_layout[0] // 0, .layout.pos_in_scrolling_layout[1] // 0, .id) as $windows |
      if ($windows | length) <= 1 then empty
      else
        ($windows | map(.is_focused) | index(true) // -1) as $cur_idx |
        $windows[($cur_idx - 1 + ($windows | length)) % ($windows | length)].id
      end
    ')
    if [ -n "$target" ]; then
      ${pkgs.niri}/bin/niri msg action focus-window --id "$target"
    fi
  '';
in {
  config = lib.mkIf config.modules.niri.enable {
    home.packages = [
      focusNextOccupied
      focusPrevOccupied
      focusNextWindow
      focusPrevWindow
    ];
  };
}
