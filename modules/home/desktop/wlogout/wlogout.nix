{
  config,
  lib,
  pkgs,
  ...
}: {
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
        @import url("colors-noctalia.css");

        * {
            font-family: "JetBrainsMono Nerd Font", FontAwesome, Roboto, Helvetica, Arial, sans-serif;
            background-image: none;
            transition: 20ms;
            box-shadow: none;
        }

        button {
            font-size: 20px;
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
            border-style: solid;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
