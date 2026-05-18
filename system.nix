{...}: let
  inherit
    (import ./settings.nix)
    flakeDir
    ;
in {
  imports = [
    ./hardware.nix
    ./modules/system
  ];

  systemModules = {
    displaymanager.enable = true;
    gpu.type = "intel";
    cpu.type = "intel";
    gpg.enable = true;
    stylix.enable = true;
    nix-ld.enable = true;
    podman.enable = true;
    throne.enable = true;
  };

  environment.variables = {
    NH_FLAKE = "${flakeDir}";
  };

  system.stateVersion = "25.11";
}
