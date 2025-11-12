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
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {
      enableHybridCodec = true;
    };
  };
  hardware.cpu.intel.updateMicrocode = true;
  # OpenGL
  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
}
