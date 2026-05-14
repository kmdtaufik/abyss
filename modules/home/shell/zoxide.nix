{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
