{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.ssh.enable {
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };
}
