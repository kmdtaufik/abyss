{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.modules.starship.enable {
    home.sessionVariables.STARSHIP_CONFIG = lib.mkForce "${config.home.homeDirectory}/.config/starship/noctalia.toml";

    programs.starship = {
      enable = true;
      settings = {};
    };
  };
}
