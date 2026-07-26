{lib, ...}: {
  options.systemModules = {
    gpu.type = lib.mkOption {
      type = lib.types.enum ["intel" "none"];
      default = "none";
      description = "Type of GPU to configure. Options: intel, none";
    };
    cpu.type = lib.mkOption {
      type = lib.types.enum ["intel" "amd" "none"];
      default = "none";
      description = "Type of CPU to configure. Options: intel, amd, none";
    };
    gpg.enable = lib.mkEnableOption "gpg";
    stylix.enable = lib.mkEnableOption "stylix";
    nix-ld.enable = lib.mkEnableOption "nix-ld";
    podman.enable = lib.mkEnableOption "podman";
    displaymanager.enable = lib.mkEnableOption "displaymanager";
    throne.enable = lib.mkEnableOption "throne";
  };
}
