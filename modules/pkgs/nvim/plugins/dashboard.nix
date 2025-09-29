{
  vim.utility.snacks-nvim = {
    enable = true;
    setupOpts = {
      dashboard = {
        enabled = true;
        width = 60;
        #Define presets
        preset = {
          header = builtins.concatStringsSep "\n" [
            "                                                                       "
            "                                                                     "
            "       ████ ██████           █████      ██                     "
            "      ███████████             █████                             "
            "      █████████ ███████████████████ ███   ███████████   "
            "     █████████  ███    █████████████ █████ ██████████████   "
            "    █████████ ██████████ █████████ █████ █████ ████ █████   "
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  "
            " ██████  █████████████████████ ████ █████ █████ ████ ██████ "
            "                                                                       "
            "                                                                       "
          ];

          keys = [
            {
              icon = " ";
              key = "f";
              desc = "Find File";
              action = ":lua  Snacks.dashboard.pick('files',{ cwd = find_project_root() }) ";
            }
            {
              icon = " ";
              key = "n";
              desc = "New File";
              action = ":ene | startinsert";
            }
            {
              icon = " ";
              key = "g";
              desc = "Find Text";
              action = ":lua Snacks.dashboard.pick('live_grep',{ cwd = find_project_root() }) ";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.dashboard.pick('oldfiles') ";
            }
            {
              icon = " ";
              key = "q";
              desc = "Quit";
              action = ":qa";
            }
          ];
        };
        # Define sections
        sections = [
          {
            section = "header";
          }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
    };
  };
}
