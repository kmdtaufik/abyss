{
  config,
  lib,
  ...
}: {
  imports = [
    ./scripts
  ];

  config = lib.mkIf config.modules.abyss.enable {
    # Any other abyss specific config can go here
  };
}
