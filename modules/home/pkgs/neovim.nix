{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  /*
    imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = true;
    settings.
  */
  vim = {
    viAlias = true;
    vimAlias = true;

    #theme
    theme = {
      enable = true;
      name = "catppuccin-mocha";
      style = "dark";
      transparent = true;
    };
    #lauguage support
    laguages = {
      enableLsp = true;
      enableTreesitter = true;

      nix.enable = true;
      clang.enable = true;
      ts.enable = true;
      lua.enable = true;
      html.enable = true;
      markdown.enable = true;
      python.enable = true;
    };

    #    };
  };
}
