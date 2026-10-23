{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.systemModules.noctalia.enable {
    # Noctalia NixOS module (from flake) installs the package system-wide.
    # Home-manager module owns the user service and settings.
    # Note: recommendedServices enables power-profiles-daemon which conflicts with
    # auto-cpufreq (configured in modules/system/hardware/cpu.nix). Noctalia has no
    # sub-option to exclude PPD, so recommendedServices is disabled and only safe
    # services (upower) are enabled manually. NetworkManager and bluetooth are
    # already enabled elsewhere.
    programs.noctalia = {
      enable = true;
      recommendedServices.enable = false;
    };

    services.upower.enable = true;
  };
}
