{
  pkgs,
  config,
  lib,
  ...
}:
# let
#   inherit (import ../../settings.nix) gpuType;
# in
#   lib.mkIf ("${gpuType}" == "intel")
{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {
      enableHybridCodec = true;
    };
  };
  hardware.cpu.intel.updateMicrocode = true;
  # OpenGL
  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
