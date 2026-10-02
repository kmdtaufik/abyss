{
  config,
  lib,
  ...
}: let
  inherit (import ../../../settings.nix) gitEmail;
in {
  config = lib.mkIf config.modules.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          email = gitEmail;
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
