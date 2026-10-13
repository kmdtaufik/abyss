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
      dockerCompat = true; # Keep false unless you have scripts hardcoded to 'docker'; distrobox --> true
      defaultNetwork.settings.dns_enabled = true;
    };
    environment.systemPackages = with pkgs; [podman-compose];
  };
}
