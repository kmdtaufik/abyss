{
  config,
  lib,
  ...
}: {
  imports = [
    ./swaync-settings.nix
    ./swaync-styles.nix
  ];

  config = lib.mkIf config.modules.swaync.enable {
    services.swaync.enable = true;
  };
}
