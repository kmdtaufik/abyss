{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.bash.enable {
    programs.bash = {
      enable = true;
      initExtra = ''
        if [[ $(tty) == *"pts"* ]]; then
            fastfetch --config examples/13
        fi
      '';
    };
    programs = {
      starship.enableBashIntegration = true;
      zoxide.enableBashIntegration = true;
      carapace.enableBashIntegration = true;
    };
  };
}
