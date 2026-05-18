{
  pkgs,
  inputs,
  ...
}: {
  # List services that you want to enable:
  services.openssh.enable = true;
  services.fstrim.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
    ];
    configPackages = [
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
    ];
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.pulseaudio.enable = false;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gcr-ssh-agent.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  security.pam.services.hyprlock = {
    enableGnomeKeyring = true;
  };
  services.auto-cpufreq.enable = true;
}
