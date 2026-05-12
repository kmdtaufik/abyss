{
  # Enable Podman
  virtualisation.podman = {
    enable = true;
    dockerCompat = false; # Keep false unless you have scripts hardcoded to 'docker'
    defaultNetwork.settings.dns_enabled = true;
  };
}
