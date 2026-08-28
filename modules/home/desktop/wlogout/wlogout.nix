{
  config,
  lib,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  config = lib.mkIf config.modules.wlogout.enable {
    home.file.".config/wlogout/icons" = {
      source = ./icons;
      recursive = true;
    };

    programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Exit";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
      style = ''
        * {
            font-family: "JetBrainsMono Nerd Font", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            background-image: none;
            transition: 20ms;
            box-shadow: none;
        }

        window {
            background-color: alpha(#${colors.base00}, 0.5);
        }

        button {
            color: #${colors.base05};
            font-size: 20px;

            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;

            border-style: solid;
            background-color: alpha(#${colors.base01}, 0.3);
            border: 3px solid #${colors.base05};

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        button:focus,
        button:active,
        button:hover {
            color: #${colors.base0D};
            background-color: alpha(#${colors.base01}, 0.5);
            border: 3px solid #${colors.base0D};
        }

        #lock {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/lock.png"));
        }

        #logout {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/logout.png"));
        }

        #suspend {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/sleep.png"));
        }

        #hibernate {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/sleep.png"));
        }

        #shutdown {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/power.png"));
        }

        #reboot {
            margin: 10px;
            border-radius: 20px;
            background-image: image(url("icons/restart.png"));
        }
      '';
    };
  };
}
