{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.direnv.enable {
    programs.direnv = {
      enable = true;
      silent = false;
      # loadInNixShell = false;
      nix-direnv.enable = true;
      # enableFishIntegration = true;
      # enableBashIntegration = true;
    };
  };
}
