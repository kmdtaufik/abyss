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
              action = ":lua  Snacks.picker.files({ cwd = find_project_root() }) ";
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
              action = ":lua Snacks.picker.grep({ cwd = find_project_root() }) ";
            }
            {
              icon = " ";
              key = "r";
              desc = "Recent Files";
              action = ":lua Snacks.picker.recent() ";
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
