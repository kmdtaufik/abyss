{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.stylix.enable {
    stylix = {
      targets = {
        btop.enable = true;
        bat.enable = true;
        fzf.enable = true;
      };
    };
  };
}
