{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.ssh.enable {
    services.ssh-agent = {
      enable = true;
    };
    programs.ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };
  };
}
