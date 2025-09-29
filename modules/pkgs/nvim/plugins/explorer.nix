{
  vim = {
    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        explorer = {
          enabled = true;
          replace_netrw = true;
        };
      };
    };

    # Keymaps should be separate from the plugin config
    keymaps = [
      {
        key = "<leader>e";
        mode = ["n"];
        action = ":lua Snacks.explorer({ cwd = find_project_root() })<CR> ";
        desc = "Toggle Explorer (root dir)";
      }
      {
        key = "<leader>E";
        mode = ["n"];
        action = ":lua Snacks.explorer() <CR>";
        desc = "Toggle Explorer (cwd)";
      }
    ];
  };
}
