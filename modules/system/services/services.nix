{
  pkgs,
  inputs,
  ...
}: {
  # List services that you want to enable:
  services.openssh.enable = true;
  services.fstrim.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
