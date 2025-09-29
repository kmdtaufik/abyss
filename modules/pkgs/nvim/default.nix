{
  imports = [
    ./languages.nix
    ./plugins
  ];

  vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };
    statusline.lualine.enable = true;

    luaConfigPost =
      /*
      lua
      */
      ''
          local function find_project_root()
          local path = vim.api.nvim_buf_get_name(0)
          -- fallback to current working directory if buffer is unnamed
          path = path ~= "" and vim.fs.dirname(path) or vim.loop.cwd()

          -- Use os_homedir for 'stop'
          local root = vim.fs.find(
            {'.git', '.svn', '.hg', 'Makefile', 'package.json', 'Cargo.toml', 'pyproject.toml', 'go.mod'},
            {
              upward = true,
              stop = vim.loop.os_homedir(),
              path = path,
            }
          )[1]

          return root and vim.fs.dirname(root) or vim.loop.cwd()
        end

        _G.find_project_root = find_project_root
      '';
  };
}
