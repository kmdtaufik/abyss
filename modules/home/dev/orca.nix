{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.orca.homeManagerModules.default
  ];

  config = lib.mkIf config.modules.orca.enable {
    programs.orca-ide = {
      enable = true;
      addDefaultDeps = true;
    };
  };
}
