{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.starship.enable {
    programs.starship = {
      enable = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        git_status = {
          ahead = "\${count}";
          behind = "\${count}";
          deleted = "x(red)";
          diverged = "\${ahead_count}\${behind_count}";
          style = "foreground";
          conflicted = "[≠](red)";
          untracked = "[?](yellow)";
          modified = "[~](orange)";
        };

        git_branch = {
          symbol = " ";
          style = "bold purple";
        };

        nix_shell = {
          format = "via [$symbol(($name))]($style) ";
          symbol = " ";
        };

        cmd_duration = {
          disabled = false;
          style = "bold orange";
          format = "took [$duration]($style)";
          show_milliseconds = true;
          show_notifications = true;
          min_time_to_notify = 30000;
        };

        battery = {
          charging_symbol = "";
          disabled = true;
          discharging_symbol = "";
          full_symbol = "";
          display = [
            {
              disabled = false;
              style = "bold red";
              threshold = 15;
            }
          ];
        };
      };
    };
    stylix.targets.starship.enable = true;
  };
}
