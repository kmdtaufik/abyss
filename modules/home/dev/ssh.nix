{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.ssh.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false; # Disable the deprecated default config
      settings = {
        "*" = {
          AddKeysToAgent = "yes";
          IdentitiesOnly = "yes"; # Home-manager's old default
        };
      };
    };
  };
}
