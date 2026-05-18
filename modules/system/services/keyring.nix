{
  services.gnome = {
    gnome-keyring.enable = true;
    gcr-ssh-agent.enable = true;
  };
  environment.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
  };
}
