{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    settings = [
      {
        layer = "top";
        #position = "top";
        margin-top = 14;
        margin-bottom = 0;
        margin-left = 14;
        margin-right = 14;
        spacing = 0;

        modules-left = [
          # "custom/appmenu"
          "hyprland/workspaces"
          "hyprland/window"
          # "group/links"
          # "group/quicklinks"
          "custom/empty"
        ];

        modules-center = [
          "clock"
          "custom/empty"
        ];

        modules-right = [
          #"custom/updates"
          "pulseaudio"
          "bluetooth"
          "network"
          #"battery"
          # "power-profiles-daemon"
          "group/hardware"
          "group/tools"
          "tray"
          "custom/notification"
          # "custom/exit"
        ];

        # Quicklink modules
        "custom/quicklink_browser" = {
          format = "";
          on-click = "~/.config/ml4w/settings/browser.sh";
          tooltip-format = "Open Browser";
        };
        "custom/quicklink_filemanager" = {
          format = "";
          on-click = "~/.config/ml4w/settings/filemanager.sh";
          tooltip-format = "Open Filemanager";
        };
        "custom/quicklink_email" = {
          format = "";
          on-click = "~/.config/ml4w/settings/email.sh";
          tooltip-format = "Open Email Client";
        };
        "custom/quicklink_chromium" = {
          format = "";
          on-click = "chromium";
          tooltip-format = "Open Chromium";
        };
        "custom/quicklink_edge" = {
          format = "";
          on-click = "edge";
          tooltip-format = "Open Edge";
        };
        "custom/quicklink_firefox" = {
          format = "";
          on-click = "firefox";
          tooltip-format = "Open Firefox";
        };
        "custom/quicklink_thunderbird" = {
          format = "";
          on-click = "thunderbird";
          tooltip-format = "Open Thunderbird";
        };
        "custom/quicklink_calculator" = {
          format = "";
          on-click = "~/.config/ml4w/settings/calculator.sh";
          tooltip-format = "Open calculator";
        };
        "custom/quicklinkempty" = {};

        # Quicklinks group
        "group/quicklinks" = {
          orientation = "horizontal";
          modules = [
            "custom/quicklink_browser"
            "custom/quicklink_email"
            "custom/quicklink_filemanager"
            "custom/quicklinkempty"
          ];
        };

        # Workspaces
        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace r-1";
          on-scroll-down = "hyprctl dispatch workspace r+1";
          on-click = "activate";
          active-only = false;
          all-outputs = true;
          format = "{}";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
          };
          persistent-workspaces = {
            "*" = 3;
          };
        };

        # Window module
        "hyprland/window" = {
          format = "{class}";
          max-length = 60;
          # rewrite = {
          #   "(.*) - Brave" = "$1";
          #   "(.*) - Chromium" = "$1";
          #   "(.*) - Brave Search" = "$1";
          #   "(.*) - Outlook" = "$1";
          #   "(.*) Microsoft Teams" = "$1";
          # };
          separate-outputs = true;
        };

        # Empty module
        "custom/empty" = {
          format = "";
        };

        # Tools
        "custom/tools" = {
          format = "";
          tooltip-format = "Tools";
        };

        # Cliphist
        "custom/cliphist" = {
          format = "";
          on-click = "sleep 0.1 && ${config.home.homeDirectory}/.config/ml4w/scripts/cliphist.sh";
          on-click-right = "sleep 0.1 && ${config.home.homeDirectory}/.config/ml4w/scripts/cliphist.sh d";
          on-click-middle = "sleep 0.1 && ${config.home.homeDirectory}/.config/ml4w/scripts/cliphist.sh w";
          tooltip-format = "Left: Open clipboard Manager\nRight: Delete an entry\nMiddle: Clear list";
        };

        # Notification module
        "custom/notification" = {
          tooltip-format = "Left: Notifications\nRight: Do not disturb";
          format = "{icon}";
          format-icons = {
            notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            none = "";
            "dnd-notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
            "dnd-inhibited-none" = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # App Menu
        "custom/appmenu" = {
          format = "Apps";
          on-click = "sleep 0.2; pkill rofi || rofi -show drun -replace";
          on-click-right = "${config.home.homeDirectory}/.config/hypr/scripts/keybindings.sh";
          tooltip-format = "Left: Open the application launcher\nRight: Show all keybindings";
        };

        # Exit Menu
        "custom/exit" = {
          format = "";
          on-click = "${config.home.homeDirectory}/.config/ml4w/scripts/wlogout.sh";
          on-click-right = "hyprlock";
          tooltip-format = "Left: Power menu\nRight: Lock screen";
        };

        # Hardware group
        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
          };
          modules = [
            "custom/system"
            "disk"
            "cpu"
            "memory"
            "hyprland/language"
          ];
        };

        # Tools group
        "group/tools" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "not-memory";
            transition-left-to-right = false;
          };
          modules = [
            "custom/tools"
            "custom/cliphist"
            "custom/hypridle"
          ];
        };

        # Links group
        "group/links" = {
          orientation = "horizontal";
          modules = [
            "custom/chatgpt"
            "custom/empty"
          ];
        };

        # System info
        "custom/system" = {
          format = "";
          tooltip = false;
        };

        # CPU
        "cpu" = {
          format = "/ C {usage}% ";
          on-click = "${config.home.homeDirectory}/.config/ml4w/settings/system-monitor.sh";
        };

        # Memory
        "memory" = {
          format = "/ M {}% ";
          on-click = "${config.home.homeDirectory}/.config/ml4w/settings/system-monitor.sh";
        };

        # Disk
        "disk" = {
          interval = 30;
          format = "D {percentage_used}% ";
          path = "/";
          on-click = "${config.home.homeDirectory}/.config/ml4w/settings/system-monitor.sh";
        };

        # Language
        "hyprland/language" = {
          format = "/ K {short}";
        };

        # Network
        "network" = {
          format = "{ifname}";
          format-wifi = " {essid} ({signalStrength}%)";
          format-ethernet = "  {ifname}";
          format-disconnected = "Disconnected ⚠";
          tooltip-format = " {ifname} via {gwaddri}";
          tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
          tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
          tooltip-format-disconnected = "Disconnected";
          max-length = 50;
          on-click = "${config.home.homeDirectory}/.config/ml4w/settings/networkmanager.sh";
          on-click-right = "${config.home.homeDirectory}/.config/ml4w/scripts/nm-applet.sh toggle";
        };

        # Battery
        /*
          "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged = "  {capacity}%";
          format-alt = "{icon}  {time}";
          format-icons = [
            " "
            " "
            " "
            " "
            " "
          ];
        };
        */

        # Power Profiles
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            "power-saver" = "";
          };
        };

        # Audio
        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = " ";
            "hands-free" = " ";
            headset = " ";
            phone = " ";
            portable = " ";
            car = " ";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        # Bluetooth
        "bluetooth" = {
          format = " {status}";
          format-disabled = "";
          format-off = "";
          interval = 30;
          on-click = "";
          format-no-controller = "";
        };

        # Clock
        "clock" = {
          format = "{:%H:%M}";
          on-click = "flatpak run com.ml4w.calendar";
          timezone = "";
          tooltip = true;
          tooltip-format = "{:%A, %B %d, %Y}";
        };

        # Tray
        "tray" = {
          icon-size = 21;
          spacing = 10;
        };
      }
    ];
  };
}
