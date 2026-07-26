{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.systemModules.podman.enable {
    # Enable Podman
    virtualisation.podman = {
      enable = true;
      dockerCompat = false; # Keep false unless you have scripts hardcoded to 'docker'
      defaultNetwork.settings.dns_enabled = true;
    };
    environment.systemPackages = with pkgs; [podman-compose];
  };
}
