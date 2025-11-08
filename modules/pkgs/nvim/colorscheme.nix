{pkgs, ...}: {
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
      transparent = true;
      # extraConfig = ''
      #       require('tokyonight').setup {
      #       transparent = true,
      #       styles = {
      #         -- EXPLICITLY setting these to "transparent" resolves the issue:
      #         sidebars = "transparent",
      #         floats = "transparent",
      #       },
      #   }
      # '';
    };
  };
}
