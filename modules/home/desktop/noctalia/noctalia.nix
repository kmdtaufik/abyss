{
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  config = lib.mkIf config.modules.noctalia.enable {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      checkConfig = true;
    };
  };
}
