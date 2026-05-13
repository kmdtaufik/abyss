{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = "147173391+kmdtaufik@users.noreply.github.com";
          name = "Md Taufik Khan";
        };

        gpg.format = "ssh";
      };
      signing = {
        key = "~/.ssh/id_ed25519_signing.pub";
        signByDefault = true;
      };
    };
  };
}
