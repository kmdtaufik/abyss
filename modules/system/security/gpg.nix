{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.systemModules.gpg.enable {
    programs.gnupg = {
      agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-tty;
      };
    };
  };
}
