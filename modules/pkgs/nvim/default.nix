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
  };
}
